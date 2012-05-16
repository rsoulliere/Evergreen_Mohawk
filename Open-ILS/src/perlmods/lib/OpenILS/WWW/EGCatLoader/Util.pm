package OpenILS::WWW::EGCatLoader;
use strict; use warnings;
use Apache2::Const -compile => qw(OK DECLINED FORBIDDEN HTTP_INTERNAL_SERVER_ERROR REDIRECT HTTP_BAD_REQUEST);
use OpenSRF::Utils::Logger qw/$logger/;
use OpenILS::Utils::CStoreEditor qw/:funcs/;
use OpenILS::Utils::Fieldmapper;
use OpenILS::Application::AppUtils;
use OpenSRF::MultiSession;
my $U = 'OpenILS::Application::AppUtils';

my $ro_object_subs; # cached subs
our %cache = ( # cached data
    map => {aou => {}}, # others added dynamically as needed
    list => {},
    search => {},
    org_settings => {}
);

sub init_ro_object_cache {
    my $self = shift;
    my $e = $self->editor;
    my $ctx = $self->ctx;

    # reset org unit setting cache on each page load to avoid the 
    # requirement of reloading apache with each org-setting change
    $cache{org_settings} = {};

    if($ro_object_subs) {
        # subs have been built.  insert into the context then move along.
        $ctx->{$_} = $ro_object_subs->{$_} for keys %$ro_object_subs;
        return;
    }

    # make all "field_safe" classes accesible by default in the template context
    my @classes = grep {
        ($Fieldmapper::fieldmap->{$_}->{field_safe} || '') =~ /true/i
    } keys %{ $Fieldmapper::fieldmap };

    for my $class (@classes) {

        my $hint = $Fieldmapper::fieldmap->{$class}->{hint};
        next if $hint eq 'aou'; # handled separately

        my $ident_field =  $Fieldmapper::fieldmap->{$class}->{identity};
        (my $eclass = $class) =~ s/Fieldmapper:://o;
        $eclass =~ s/::/_/g;

        my $list_key = "${hint}_list";
        my $get_key = "get_$hint";
        my $search_key = "search_$hint";

        # Retrieve the full set of objects with class $hint
        $ro_object_subs->{$list_key} = sub {
            my $method = "retrieve_all_$eclass";
            $cache{list}{$hint} = $e->$method() unless $cache{list}{$hint};
            return $cache{list}{$hint};
        };
    
        # locate object of class $hint with Ident field $id
        $cache{map}{$hint} = {};
        $ro_object_subs->{$get_key} = sub {
            my $id = shift;
            return $cache{map}{$hint}{$id} if $cache{map}{$hint}{$id}; 
            ($cache{map}{$hint}{$id}) = grep { $_->$ident_field eq $id } @{$ro_object_subs->{$list_key}->()};
            return $cache{map}{$hint}{$id};
        };

        # search for objects of class $hint where field=value
        $cache{search}{$hint} = {};
        $ro_object_subs->{$search_key} = sub {
            my ($field, $val) = @_;
            my $method = "search_$eclass";
            $cache{search}{$hint}{$field} = {} unless $cache{search}{$hint}{$field};
            $cache{search}{$hint}{$field}{$val} = $e->$method({$field => $val}) 
                unless $cache{search}{$hint}{$field}{$val};
            return $cache{search}{$hint}{$field}{$val};
        };
    }

    $ro_object_subs->{aou_tree} = sub {

        # fetch the org unit tree
        unless($cache{aou_tree}) {
            my $tree = $e->search_actor_org_unit([
			    {   parent_ou => undef},
			    {   flesh            => -1,
				    flesh_fields    => {aou =>  ['children']},
				    order_by        => {aou => 'name'}
			    }
		    ])->[0];

            # flesh the org unit type for each org unit
            # and simultaneously set the id => aou map cache
            sub flesh_aout {
                my $node = shift;
                my $ro_object_subs = shift;
                $node->ou_type( $ro_object_subs->{get_aout}->($node->ou_type) );
                $cache{map}{aou}{$node->id} = $node;
                flesh_aout($_, $ro_object_subs) foreach @{$node->children};
            };
            flesh_aout($tree, $ro_object_subs);

            $cache{aou_tree} = $tree;
        }

        return $cache{aou_tree};
    };

    # Add a special handler for the tree-shaped org unit cache
    $ro_object_subs->{get_aou} = sub {
        my $org_id = shift;
        return undef unless defined $org_id;
        $ro_object_subs->{aou_tree}->(); # force the org tree to load
        return $cache{map}{aou}{$org_id};
    };

    # Returns a flat list of aou objects.  often easier to manage than a tree.
    $ro_object_subs->{aou_list} = sub {
        $ro_object_subs->{aou_tree}->(); # force the org tree to load
        return [ values %{$cache{map}{aou}} ];
    };


    # turns an ISO date into something TT can understand
    $ro_object_subs->{parse_datetime} = sub {
        my $date = shift;
        $date = DateTime::Format::ISO8601->new->parse_datetime(cleanse_ISO8601($date));
        return sprintf(
            "%0.2d:%0.2d:%0.2d %0.2d-%0.2d-%0.4d",
            $date->hour,
            $date->minute,
            $date->second,
            $date->day,
            $date->month,
            $date->year
        );
    };

    # retrieve and cache org unit setting values
    $ro_object_subs->{get_org_setting} = sub {
        my($org_id, $setting) = @_;

        $cache{org_settings}{$org_id} = {} 
            unless $cache{org_settings}{$org_id};

        $cache{org_settings}{$org_id}{$setting} = 
            $U->ou_ancestor_setting_value($org_id, $setting)
                unless exists $cache{org_settings}{$org_id}{$setting};

        return $cache{org_settings}{$org_id}{$setting};
    };

    $ctx->{$_} = $ro_object_subs->{$_} for keys %$ro_object_subs;
}

sub generic_redirect {
    my $self = shift;
    my $url = shift;
    my $cookie = shift; # can be an array of cgi.cookie's

    $self->apache->print(
        $self->cgi->redirect(
            -url => $url || 
                $self->cgi->param('redirect_to') || 
                $self->ctx->{referer} || 
                $self->ctx->{home_page},
            -cookie => $cookie
        )
    );

    return Apache2::Const::REDIRECT;
}

sub get_records_and_facets {
    my ($self, $rec_ids, $facet_key, $unapi_args) = @_;

    $unapi_args ||= {};
    $unapi_args->{site} ||= $self->ctx->{aou_tree}->()->shortname;
    $unapi_args->{depth} ||= $self->ctx->{aou_tree}->()->ou_type->depth;
    $unapi_args->{flesh_depth} ||= 5;

    my @data;
    my $ses = OpenSRF::MultiSession->new(
        app => 'open-ils.cstore',
        cap => 10, # XXX config
        success_handler => sub {
            my($self, $req) = @_;
            my $data = $req->{response}->[0]->content;
            my $xml = XML::LibXML->new->parse_string($data->{'unapi.bre'})->documentElement;

            # Protect against legacy invalid MARCXML that might not have a 901c
            my $bre_id;
            my $bre_id_nodes =  $xml->find('*[@tag="901"]/*[@code="c"]');
            if ($bre_id_nodes) {
                $bre_id =  $bre_id_nodes->[0]->textContent;
            } else {
                $logger->warn("Missing 901 subfield 'c' in " . $xml->toString());
            }
            push(@data, {id => $bre_id, marc_xml => $xml});
        }
    );

    $ses->request(
        'open-ils.cstore.json_query',
         {from => [
            'unapi.bre', $_, 'marcxml','record', 
            $unapi_args->{flesh}, 
            $unapi_args->{site}, 
            $unapi_args->{depth}, 
            $unapi_args->{flesh_depth}, 
        ]}
    ) for @$rec_ids;

    # collect the facet data
    my $search = OpenSRF::AppSession->create('open-ils.search');
    my $facet_req = $search->request(
        'open-ils.search.facet_cache.retrieve', $facet_key, 10
    ) if $facet_key;

    # gather up the unapi recs
    $ses->session_wait(1);

    my $facets = {};
    if ($facet_key) {
        my $tmp_facets = $facet_req->gather(1);
        for my $cmf_id (keys %$tmp_facets) {

            # sort highest to lowest match count
            my @entries;
            my $entries = $tmp_facets->{$cmf_id};
            for my $ent (keys %$entries) {
                push(@entries, {value => $ent, count => $$entries{$ent}});
            };
            @entries = sort { $b->{count} <=> $a->{count} } @entries;
            $facets->{$cmf_id} = {
                cmf => $self->ctx->{get_cmf}->($cmf_id),
                data => \@entries
            }
        }
    } else {
        $facets = undef;
    }

    $search->kill_me;

    return ($facets, @data);
}

# TODO: blend this code w/ ^-- get_records_and_facets
sub fetch_marc_xml_by_id {
    my ($self, $id_list) = @_;
    $id_list = [$id_list] unless ref($id_list);

    {
        no warnings qw/numeric/;
        $id_list = [map { int $_ } @$id_list];
        $id_list = [grep { $_ > 0} @$id_list];
    };

    return {} if scalar(@$id_list) < 1;

    # I'm just sure there needs to be some more efficient way to get all of
    # this.
    my $results = $self->editor->json_query({
        "select" => {"bre" => ["id", "marc"]},
        "from" => {"bre" => {}},
        "where" => {"id" => $id_list}
    }, {substream => 1}) or return $self->editor->die_event;

    my $marc_xml = {};
    for my $r (@$results) {
        $marc_xml->{$r->{"id"}} =
            (new XML::LibXML)->parse_string($r->{"marc"});
    }

    return $marc_xml;
}

sub _get_search_lib {
    my $self = shift;

    # loc param takes precedence
    my $loc = $self->cgi->param('loc');
    return $loc if $loc;

    if ($self->ctx->{user}) {
        # See if the user has a search library preference
        my $lset = $self->editor->search_actor_user_setting({
            usr => $self->ctx->{user}->id, 
            name => 'opac.default_search_location'
        })->[0];
        return OpenSRF::Utils::JSON->JSON2perl($lset->value) if $lset;

        # Otherwise return the user's home library
        return $self->ctx->{user}->home_ou;
    }

    if ($self->cgi->param('physical_loc')) {
        return $self->cgi->param('physical_loc');
    }

    return $self->ctx->{aou_tree}->()->id;
}

1;
