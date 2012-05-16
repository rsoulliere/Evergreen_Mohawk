package OpenILS::WWW::EGCatLoader;
use strict; use warnings;
use Apache2::Const -compile => qw(OK DECLINED FORBIDDEN HTTP_INTERNAL_SERVER_ERROR REDIRECT HTTP_BAD_REQUEST);
use OpenSRF::Utils::Logger qw/$logger/;
use OpenILS::Utils::CStoreEditor qw/:funcs/;
use OpenILS::Utils::Fieldmapper;
use OpenILS::Application::AppUtils;
my $U = 'OpenILS::Application::AppUtils';

# context additions: 
#   record : bre object
sub load_record {
    my $self = shift;
    my $ctx = $self->ctx;
    $ctx->{page} = 'record';  

    my $org = $self->_get_search_lib();
    my $depth = $self->cgi->param('depth') || $ctx->{get_aou}->($org)->ou_type->depth;
    my $copy_limit = int($self->cgi->param('copy_limit') || 10);
    my $copy_offset = int($self->cgi->param('copy_offset') || 0);

    my $rec_id = $ctx->{page_args}->[0]
        or return Apache2::Const::HTTP_BAD_REQUEST;

    $self->get_staff_search_settings;
    if ($ctx->{staff_saved_search_size}) {
        $ctx->{saved_searches} = ($self->staff_load_searches)[1];
    }

    $self->fetch_related_search_info($rec_id);

    # run copy retrieval in parallel to bib retrieval
    # XXX unapi
    my $cstore = OpenSRF::AppSession->create('open-ils.cstore');
    my $copy_rec = $cstore->request(
        'open-ils.cstore.json_query.atomic', 
        $self->mk_copy_query($rec_id, $org, $depth, $copy_limit, $copy_offset)
    );

    my (undef, @rec_data) = $self->get_records_and_facets([$rec_id], undef, {flesh => '{holdings_xml,bmp,mra,acp,acnp,acns}'});
    $ctx->{bre_id} = $rec_data[0]->{id};
    $ctx->{marc_xml} = $rec_data[0]->{marc_xml};

    $ctx->{copies} = $copy_rec->gather(1);
    $ctx->{copy_limit} = $copy_limit;
    $ctx->{copy_offset} = $copy_offset;

    $ctx->{have_holdings_to_show} = 0;
    $ctx->{have_mfhd_to_show} = 0;
    $self->get_hold_copy_summary($rec_id, $org);

    $cstore->kill_me;

    if (
        $ctx->{get_org_setting}->
            ($org, "opac.fully_compressed_serial_holdings")
    ) {
        $ctx->{holding_summaries} =
            $self->get_holding_summaries($rec_id, $org, $depth);

        $ctx->{have_holdings_to_show} =
            scalar(@{$ctx->{holding_summaries}->{basic}}) ||
            scalar(@{$ctx->{holding_summaries}->{index}}) ||
            scalar(@{$ctx->{holding_summaries}->{supplement}});
    } else {
        $ctx->{mfhd_summaries} =
            $self->get_mfhd_summaries($rec_id, $org, $depth);

        if ($ctx->{mfhd_summaries} && scalar(@{$ctx->{mfhd_summaries}})
        ) {
            $ctx->{have_mfhd_to_show} = 1;
        };
    }

    my %expandies = (
        marchtml => sub {
            $ctx->{marchtml} = $self->mk_marc_html($rec_id);
        },
        issues => sub {
            $ctx->{expanded_holdings} =
                $self->get_expanded_holdings($rec_id, $org, $depth)
                if $ctx->{have_holdings_to_show};
        },
        cnbrowse => sub {
            $self->prepare_browse_call_numbers();
        }
    );

    my @expand = $self->cgi->param('expand');
    if (grep {$_ eq 'all'} @expand) {
        $ctx->{expand_all} = 1;
        $expandies{$_}->() for keys %expandies;

    } else {
        for my $exp (@expand) {
            $ctx->{"expand_$exp"} = 1;
            $expandies{$exp}->() if exists $expandies{$exp};
        }
    }

    return Apache2::Const::OK;
}

# collect IDs and info on the search that lead to this details page
# If no search query, etc is present, we leave ctx.search_result_index == -1
sub fetch_related_search_info {
    my $self = shift;
    my $rec_id = shift;
    my $ctx = $self->ctx;
    $ctx->{search_result_index} = -1;

    $self->load_rresults(internal => 1);

    my @search_ids = @{$ctx->{ids}};
    return unless @search_ids;

    for my $idx (0..$#search_ids) {
        if ($search_ids[$idx] == $rec_id) {
            $ctx->{prev_search_record} = $search_ids[$idx - 1] if $idx > 0;
            $ctx->{next_search_record} = $search_ids[$idx + 1];
            $ctx->{search_result_index} = $idx;
            last;
        }
    }

    $ctx->{first_search_record} = $search_ids[0];
    $ctx->{last_search_record} = $search_ids[-1];
}


sub mk_copy_query {
    my $self = shift;
    my $rec_id = shift;
    my $org = shift;
    my $depth = shift;
    my $copy_limit = shift;
    my $copy_offset = shift;

    my $query = {
        select => {
            acp => ['id', 'barcode', 'circ_lib', 'create_date', 'age_protect', 'holdable'],
            acpl => [
                {column => 'name', alias => 'copy_location'},
                {column => 'holdable', alias => 'location_holdable'}
            ],
            ccs => [
                {column => 'name', alias => 'copy_status'},
                {column => 'holdable', alias => 'status_holdable'}
            ],
            acn => [
                {column => 'label', alias => 'call_number_label'},
                {column => 'id', alias => 'call_number'}
            ],
            circ => ['due_date'],
            acnp => [
                {column => 'label', alias => 'call_number_prefix_label'},
                {column => 'id', alias => 'call_number_prefix'}
            ],
            acns => [
                {column => 'label', alias => 'call_number_suffix_label'},
                {column => 'id', alias => 'call_number_suffix'}
            ],
            bmp => [
                {column => 'label', alias => 'part_label'},
            ]
        },

        from => {
            acp => {
                acn => { 
                    join => { 
                        acnp => { fkey => 'prefix' },
                        acns => { fkey => 'suffix' }
                    },
                    filter => [{deleted => 'f'}, {record => $rec_id}],
                },
                circ => { # If the copy is circulating, retrieve the open circ
                    type => 'left',
                    filter => {checkin_time => undef}
                },
                acpl => {},
                ccs => {},
                aou => {},
                acpm => {
                    type => 'left',
                    join => {
                        bmp => { type => 'left' }
                    }
                }
            }
        },

        where => {
            '+acp' => {deleted => 'f' }
        },

        order_by => [
            {class => 'aou', field => 'name'}, 
            {class => 'acn', field => 'label'}
        ],

        limit => $copy_limit,
        offset => $copy_offset
    };

    # XXX In the future, $sort_org should be understood to be an abstration
    # that refers to something configurable, not necessariyl physical_loc.

    if (my $sort_org = $self->ctx->{physical_loc}) {
        unshift @{$query->{order_by}}, {
            class => 'acp', field => 'circ_lib', transform => 'numeric_eq',
            params => [$sort_org], direction => 'desc'
        };
    }

    if($org != $self->ctx->{aou_tree}->()->id) { 
        # no need to add the org join filter if we're not actually filtering
        $query->{from}->{acp}->{aou} = {
            fkey => 'circ_lib',
            field => 'id',
            filter => {
                id => {
                    in => {
                        select => {aou => [{
                            column => 'id', 
                            transform => 'actor.org_unit_descendants', 
                            result_field => 'id', 
                            params => [$depth]
                        }]},
                        from => 'aou',
                        where => {id => $org}
                    }
                }
            }
        }
    };

    # Filter hidden items if this is the public catalog
    unless($self->ctx->{is_staff}) { 
        $query->{where}->{'+acp'}->{opac_visible} = 't';
        $query->{from}->{'acp'}->{'acpl'}->{filter} = {opac_visible => 't'};
        $query->{from}->{'acp'}->{'ccs'}->{filter} = {opac_visible => 't'};
    }

    return $query;
}

sub mk_marc_html {
    my($self, $rec_id) = @_;

    # could be optimized considerably by performing the xslt on the already fetched record
    return $U->simplereq(
        'open-ils.search', 
        'open-ils.search.biblio.record.html', $rec_id, 1);
}

sub get_holding_summaries {
    my ($self, $rec_id, $org, $depth) = @_;

    my $serial = create OpenSRF::AppSession("open-ils.serial");
    my $result = $serial->request(
        "open-ils.serial.bib.summary_statements",
        $rec_id, {"org_id" => $org, "depth" => $depth}
    )->gather(1);

    $serial->kill_me;
    return $result;
}

sub get_mfhd_summaries {
    my ($self, $rec_id, $org, $depth) = @_;

    my $serial = create OpenSRF::AppSession("open-ils.search");
    my $result = $serial->request(
        "open-ils.search.serial.record.bib.retrieve",
        $rec_id, $org, $depth
    )->gather(1);

    $serial->kill_me;
    return $result;
}

sub get_expanded_holdings {
    my ($self, $rec_id, $org, $depth) = @_;

    my $holding_limit = int($self->cgi->param("holding_limit") || 10);
    my $holding_offset = int($self->cgi->param("holding_offset") || 0);
    my $type = $self->cgi->param("expand_holding_type");

    my $serial =  create OpenSRF::AppSession("open-ils.serial");
    my $result = $serial->request(
        "open-ils.serial.received_siss.retrieve.by_bib.atomic",
        $rec_id, {
            "ou" => $org, "depth" => $depth,
            "limit" => $holding_limit, "offset" => $holding_offset,
            "type" => $type
        }
    )->gather(1);

    $serial->kill_me;
    return $result;
}

sub any_call_number_label {
    my ($self) = @_;

    if ($self->ctx->{copies} and @{$self->ctx->{copies}}) {
        return $self->ctx->{copies}->[0]->{call_number_label};
    } else {
        return;
    }
}

sub prepare_browse_call_numbers {
    my ($self) = @_;

    my $cn = ($self->cgi->param("cn") || $self->any_call_number_label) or
        return [];

    my $org_unit = $self->ctx->{get_aou}->($self->cgi->param('loc')) ||
        $self->ctx->{aou_tree}->();

    my $supercat = create OpenSRF::AppSession("open-ils.supercat");
    my $results = $supercat->request(
        "open-ils.supercat.call_number.browse", 
        $cn, $org_unit->shortname, 9, $self->cgi->param("cnoffset")
    )->gather(1) || [];

    $supercat->kill_me;

    $self->ctx->{browsed_call_numbers} = [
        map {
            $_->record->marc(
                (new XML::LibXML)->parse_string($_->record->marc)
            );
            $_;
        } @$results
    ];
    $self->ctx->{browsing_ou} = $org_unit;
}

sub get_hold_copy_summary {
    my ($self, $rec_id, $org) = @_;
    
    my $search = OpenSRF::AppSession->create('open-ils.search');
    my $req1 = $search->request(
        'open-ils.search.biblio.record.copy_count', $org, $rec_id); 

    $self->ctx->{record_hold_count} = $U->simplereq(
        'open-ils.circ', 'open-ils.circ.bre.holds.count', $rec_id);

    $self->ctx->{copy_summary} = $req1->recv->content;

    $search->kill_me;
}

1;
