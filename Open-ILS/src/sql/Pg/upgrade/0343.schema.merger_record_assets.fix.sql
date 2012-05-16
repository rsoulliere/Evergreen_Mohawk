BEGIN;

INSERT INTO config.upgrade_log (version) VALUES ('0343'); -- miker 

CREATE OR REPLACE FUNCTION asset.merge_record_assets( target_record BIGINT, source_record BIGINT ) RETURNS INT AS $func$
DECLARE
    moved_objects INT := 0;
    source_cn     asset.call_number%ROWTYPE;
    target_cn     asset.call_number%ROWTYPE;
    metarec       metabib.metarecord%ROWTYPE;
    hold          action.hold_request%ROWTYPE;
    ser_rec       serial.record_entry%ROWTYPE;
    uri_count     INT := 0;
    counter       INT := 0;
    uri_datafield TEXT;
    uri_text      TEXT := '';
BEGIN

    -- move any 856 entries on records that have at least one MARC-mapped URI entry
    SELECT  INTO uri_count COUNT(*)
      FROM  asset.uri_call_number_map m
            JOIN asset.call_number cn ON (m.call_number = cn.id)
      WHERE cn.record = source_record;

    IF uri_count > 0 THEN

        SELECT  COUNT(*) INTO counter
          FROM  oils_xpath_table(
                    'id',
                    'marc',
                    'biblio.record_entry',
                    '//*[@tag="856"]',
                    'id=' || source_record
                ) as t(i int,c text);

        FOR i IN 1 .. counter LOOP
            SELECT  '<datafield xmlns="http://www.loc.gov/MARC21/slim" tag="856">' ||
                        array_to_string(
                            array_accum(
                                '<subfield code="' || subfield || '">' ||
                                regexp_replace(
                                    regexp_replace(
                                        regexp_replace(data,'&','&amp;','g'),
                                        '>', '&gt;', 'g'
                                    ),
                                    '<', '&lt;', 'g'
                                ) || '</subfield>'
                            ), ''
                        ) || '</datafield>' INTO uri_datafield
              FROM  oils_xpath_table(
                        'id',
                        'marc',
                        'biblio.record_entry',
                        '//*[@tag="856"][position()=' || i || ']/*/@code|' ||
                        '//*[@tag="856"][position()=' || i || ']/*[@code]',
                        'id=' || source_record
                    ) as t(id int,subfield text,data text);

            uri_text := uri_text || uri_datafield;
        END LOOP;

        IF uri_text <> '' THEN
            UPDATE  biblio.record_entry
              SET   marc = regexp_replace(marc,'(</[^>]*record>)', uri_text || E'\\1')
              WHERE id = target_record;
        END IF;

    END IF;

    -- Find and move metarecords to the target record
    SELECT  INTO metarec *
      FROM  metabib.metarecord
      WHERE master_record = source_record;

    IF FOUND THEN
        UPDATE  metabib.metarecord
          SET   master_record = target_record,
            mods = NULL
          WHERE id = metarec.id;

        moved_objects := moved_objects + 1;
    END IF;

    -- Find call numbers attached to the source ...
    FOR source_cn IN SELECT * FROM asset.call_number WHERE record = source_record LOOP

        SELECT  INTO target_cn *
          FROM  asset.call_number
          WHERE label = source_cn.label
            AND owning_lib = source_cn.owning_lib
            AND record = target_record;

        -- ... and if there's a conflicting one on the target ...
        IF FOUND THEN

            -- ... move the copies to that, and ...
            UPDATE  asset.copy
              SET   call_number = target_cn.id
              WHERE call_number = source_cn.id;

            -- ... move V holds to the move-target call number
            FOR hold IN SELECT * FROM action.hold_request WHERE target = source_cn.id AND hold_type = 'V' LOOP

                UPDATE  action.hold_request
                  SET   target = target_cn.id
                  WHERE id = hold.id;

                moved_objects := moved_objects + 1;
            END LOOP;

        -- ... if not ...
        ELSE
            -- ... just move the call number to the target record
            UPDATE  asset.call_number
              SET   record = target_record
              WHERE id = source_cn.id;
        END IF;

        moved_objects := moved_objects + 1;
    END LOOP;

    -- Find T holds targeting the source record ...
    FOR hold IN SELECT * FROM action.hold_request WHERE target = source_record AND hold_type = 'T' LOOP

        -- ... and move them to the target record
        UPDATE  action.hold_request
          SET   target = target_record
          WHERE id = hold.id;

        moved_objects := moved_objects + 1;
    END LOOP;

    -- Find serial records targeting the source record ...
    FOR ser_rec IN SELECT * FROM serial.record_entry WHERE record = source_record LOOP
        -- ... and move them to the target record
        UPDATE  serial.record_entry
          SET   record = target_record
          WHERE id = ser_rec.id;

        moved_objects := moved_objects + 1;
    END LOOP;

    -- Finally, "delete" the source record
    DELETE FROM biblio.record_entry WHERE id = source_record;

    -- That's all, folks!
    RETURN moved_objects;
END;
$func$ LANGUAGE plpgsql;

COMMIT;
