BEGIN;

INSERT INTO config.upgrade_log (version) VALUES ('0092'); -- miker

CREATE OR REPLACE FUNCTION is_json (TEXT) RETURNS BOOL AS $func$
    use JSON::XS;
    my $json = shift();
    eval { decode_json( $json ) };
    return $@ ? 0 : 1;
$func$ LANGUAGE PLPERLU;

ALTER TABLE action_trigger.event ADD COLUMN user_data TEXT CHECK (user_data IS NULL OR is_json( user_data ));

COMMIT;

