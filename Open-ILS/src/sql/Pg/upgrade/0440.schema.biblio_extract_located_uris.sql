BEGIN;

INSERT INTO config.upgrade_log (version) VALUES ('0440'); -- dbs

CREATE OR REPLACE FUNCTION biblio.extract_located_uris( bib_id BIGINT, marcxml TEXT, editor_id INT ) RETURNS VOID AS $func$
DECLARE
    uris            TEXT[];
    uri_xml         TEXT;
    uri_label       TEXT;
    uri_href        TEXT;
    uri_use         TEXT;
    uri_owner       TEXT;
    uri_owner_id    INT;
    uri_id          INT;
    uri_cn_id       INT;
    uri_map_id      INT;
BEGIN

    uris := oils_xpath('//*[@tag="856" and (@ind1="4" or @ind1="1") and (@ind2="0" or @ind2="1")]',marcxml);
    IF ARRAY_UPPER(uris,1) > 0 THEN
        FOR i IN 1 .. ARRAY_UPPER(uris, 1) LOOP
            -- First we pull info out of the 856
            uri_xml     := uris[i];

            uri_href    := (oils_xpath('//*[@code="u"]/text()',uri_xml))[1];
            CONTINUE WHEN uri_href IS NULL;

            uri_label   := (oils_xpath('//*[@code="y"]/text()|//*[@code="3"]/text()|//*[@code="u"]/text()',uri_xml))[1];
            CONTINUE WHEN uri_label IS NULL;

            uri_owner   := (oils_xpath('//*[@code="9"]/text()|//*[@code="w"]/text()|//*[@code="n"]/text()',uri_xml))[1];
            CONTINUE WHEN uri_owner IS NULL;

            uri_use     := (oils_xpath('//*[@code="z"]/text()|//*[@code="2"]/text()|//*[@code="n"]/text()|//*[@code="u"]/text()',uri_xml))[1];

            uri_owner := REGEXP_REPLACE(uri_owner, $re$^.*?\((\w+)\).*$$re$, E'\\1');

            SELECT id INTO uri_owner_id FROM actor.org_unit WHERE shortname = uri_owner;
            CONTINUE WHEN NOT FOUND;

            -- now we look for a matching uri
            SELECT id INTO uri_id FROM asset.uri WHERE label = uri_label AND href = uri_href AND use_restriction = uri_use AND active;
            IF NOT FOUND THEN -- create one
                INSERT INTO asset.uri (label, href, use_restriction) VALUES (uri_label, uri_href, uri_use);
                SELECT id INTO uri_id FROM asset.uri WHERE label = uri_label AND href = uri_href AND use_restriction = uri_use AND active;
            END IF;

            -- we need a call number to link through
            SELECT id INTO uri_cn_id FROM asset.call_number WHERE owning_lib = uri_owner_id AND record = bib_id AND label = '##URI##' AND NOT deleted;
            IF NOT FOUND THEN
                INSERT INTO asset.call_number (owning_lib, record, create_date, edit_date, creator, editor, label)
                    VALUES (uri_owner_id, bib_id, 'now', 'now', editor_id, editor_id, '##URI##');
                SELECT id INTO uri_cn_id FROM asset.call_number WHERE owning_lib = uri_owner_id AND record = bib_id AND label = '##URI##' AND NOT deleted;
            END IF;

            -- now, link them if they're not already
            SELECT id INTO uri_map_id FROM asset.uri_call_number_map WHERE call_number = uri_cn_id AND uri = uri_id;
            IF NOT FOUND THEN
                INSERT INTO asset.uri_call_number_map (call_number, uri) VALUES (uri_cn_id, uri_id);
            END IF;

        END LOOP;
    END IF;

    RETURN;
END;
$func$ LANGUAGE PLPGSQL;

COMMIT;
