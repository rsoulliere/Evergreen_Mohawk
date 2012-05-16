BEGIN;


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999395390', 9, 'Brooks', 'terrib1234', 
        'Terri', 'Maria', '2011-05-03', '1973-03-17', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '32961', '1809 Target Way', 't', 
        'FL', 'Vero beach', '', 'Indian river', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999395390', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999320945', 5, 'Jackson', 'shannonj1234', 
        'Shannon', 'Thomas', '2014-04-22', '1981-11-20', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '41301', '3481 Facility Island', 'f', 
        'KY', 'Campton', '', 'Wolfe', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999320945', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999355250', 5, 'Jones', 'gregoryj1234', 
        'Gregory', '', '2014-05-07', '1967-05-24', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '55927', '5150 Dinner Expressway', 'f', 
        'MN', 'Dodge center', '', 'Dodge', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999355250', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999387993', 9, 'Moran', 'vincentm1234', 
        'Vincent', 'Kenneth', '2010-12-03', '1996-05-28', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '22611', '8496 Random Trust Points', 'f', 
        'VA', 'Berryville', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999387993', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999335859', 8, 'Jones', 'gregoryj1234', 
        'Gregory', 'Adam', '2015-07-13', '1987-03-06', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '99502', '7626 Secret Institute Courts', 'f', 
        'AK', 'Anchorage', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999335859', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999373186', 7, 'Walker', 'brittanyw1234', 
        'Brittany', 'Geraldine', '2015-10-03', '1995-02-20', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '40445', '7044 Regular Index Path', 'f', 
        'KY', 'Livingston', '', 'Rockcastle', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999373186', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999384262', 9, 'Miller', 'ernestom1234', 
        'Ernesto', 'Robert', '2008-07-12', '1997-02-02', 'II');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '33157', '3403 Thundering Heat Meadows', 'f', 
        'FL', 'Miami', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999384262', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999373998', 9, 'Hill', 'roberth1234', 
        'Robert', 'Louis', '2009-11-13', '1998-05-02', 'III');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '18960', '759 Doubtful Government Extension', 't', 
        'PA', 'Sellersville', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999373998', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999376669', 7, 'Lopez', 'edwardl1234', 
        'Edward', 'Robert', '2009-03-11', '1994-08-21', 'II');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '29593', '5431 Japanese Work Rapid', 'f', 
        'SC', 'Society hill', '', 'Darlington', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999376669', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999361076', 8, 'Bell', 'andrewb1234', 
        'Andrew', 'Alberto', '2006-03-12', '1999-04-16', 'II');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '61936', '5253 Agricultural Exhibition Stravenue', 'f', 
        'IL', 'La place', '', 'Piatt', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999361076', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999376988', 9, 'Mitchell', 'jenniferm1234', 
        'Jennifer', 'Dorothy', '2007-04-07', '1981-08-19', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '61822', '8649 Raspy Goal Terrace', 't', 
        'IL', 'Champaign', '', 'Champaign', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999376988', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999390791', 7, 'Ortiz', 'richardo1234', 
        'Richard', '', '2008-05-27', '1978-06-13', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '23885', '2433 Uncomfortable Nature Greens', 'f', 
        'VA', 'Sutherland', '', 'Dinwiddie', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999390791', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999378730', 6, 'Wade', 'robertw1234', 
        'Robert', 'Coy', '2013-08-09', '1985-12-21', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '55796', '3241 Communist Boat Boulevard', 'f', 
        'MN', 'Winton', '', 'Saint louis', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999378730', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999360638', 5, 'Wise', 'janetw1234', 
        'Janet', '', '2010-02-27', '1992-08-12', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '64126', '6773 Government Hill', 'f', 
        'MO', 'Kansas city', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999360638', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999350419', 4, 'Torres', 'donaldt1234', 
        'Donald', 'Arnold', '2007-04-02', '1974-06-26', 'II');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '40847', '7194 Gorgeous Edge Dale', 'f', 
        'KY', 'Kenvir', '', 'Harlan', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999350419', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999354736', 4, 'Miller', 'jeffm1234', 
        'Jeff', 'James', '2013-02-19', '1977-03-17', 'Sr');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '80920', '9674 Filthy Firm Meadows', 'f', 
        'CO', 'Colorado springs', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999354736', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999329662', 9, 'Estes', 'leonarde1234', 
        'Leonard', '', '2012-10-24', '1994-05-07', 'III');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '20724', '6145 Superior Dress Prairie', 't', 
        'MD', 'Laurel', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999329662', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999397601', 8, 'Dunn', 'brittneyd1234', 
        'Brittney', 'Pamela', '2015-07-26', '1998-06-28', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '73838', '9753 Confident Limit Shoal', 'f', 
        'OK', 'Chester', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999397601', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999377594', 4, 'Wiggins', 'jeanw1234', 
        'Jean', 'Verna', '2009-05-25', '1991-09-25', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '23018', '6115 Thoughtful Country Ridge', 'f', 
        'VA', 'Bena', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999377594', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999371252', 9, 'Thomas', 'lelat1234', 
        'Lela', 'Sarah', '2015-04-14', '1968-04-11', 'Sr');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '60609', '4223 Spotty Chemical Stravenue', 'f', 
        'IL', 'Chicago', '', 'Cook', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999371252', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999398023', 8, 'Phillips', 'noahp1234', 
        'Noah', 'Joseph', '2012-02-18', '1993-03-17', 'III');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '33593', '2005 Inner Entry Harbor', 'f', 
        'FL', 'Trilby', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999398023', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999324566', 5, 'Mitchell', 'carolynm1234', 
        'Carolyn', 'Patrica', '2015-11-05', '1981-09-03', 'III');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '50652', '5259 Film Crossing', 't', 
        'IA', 'Lincoln', '', 'Tama', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999324566', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999379221', 5, 'Wells', 'kristenw1234', 
        'Kristen', 'Vivian', '2013-11-20', '1971-01-16', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '12450', '2302 Prisoner Way', 'f', 
        'NY', 'Lanesville', '', 'Greene', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999379221', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999373350', 8, 'Lindsey', 'noahl1234', 
        'Noah', 'Keith', '2007-06-19', '1972-11-08', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '50108', '7583 Low Surface Overpass', 'f', 
        'IA', 'Grand river', '', 'Decatur', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999373350', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999340920', 4, 'Williams', 'berthaw1234', 
        'Bertha', 'Katherine', '2010-03-19', '1986-12-08', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '20646', '3301 Acid Canyon', 'f', 
        'MD', 'La plata', '', 'Charles', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999340920', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999398482', 7, 'Rodriguez', 'jamesr1234', 
        'James', '', '2008-10-14', '1993-09-22', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '95066', '9801 Working-class Flower Meadow', 'f', 
        'CA', 'Scotts valley', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999398482', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999394378', 5, 'Byrd', 'matthewb1234', 
        'Matthew', 'David', '2007-05-02', '1965-12-15', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '43015', '9029 Note Court', 't', 
        'OH', 'Delaware', '', 'Delaware', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999394378', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999382659', 4, 'Kelley', 'sandrak1234', 
        'Sandra', 'Pearlie', '2011-06-06', '1977-01-18', 'Sr');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '56568', '4246 Fun Post Street', 'f', 
        'MN', 'Nielsville', '', 'Polk', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999382659', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999387130', 7, 'Wilson', 'bethw1234', 
        'Beth', 'Michelle', '2010-06-08', '1966-07-17', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '15341', '7780 Horrible Winner Island', 'f', 
        'PA', 'Holbrook', '', 'Greene', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999387130', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999310765', 8, 'Daniels', 'randyd1234', 
        'Randy', 'Lawrence', '2012-06-01', '1971-03-20', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '29680', '4697 Subsequent Culture Pass', 'f', 
        'SC', 'Simpsonville', '', 'Greenville', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999310765', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999335545', 9, 'Simpson', 'steves1234', 
        'Steve', 'Raymond', '2011-02-09', '1961-07-04', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '88118', '2400 Communication Mount', 'f', 
        'NM', 'Floyd', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999335545', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999360529', 5, 'Hoskins', 'jimh1234', 
        'Jim', 'Michael', '2008-11-15', '1983-08-02', 'III');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '15015', '7815 Principal Element Center', 't', 
        'PA', 'Bradfordwoods', '', 'Allegheny', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999360529', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999357038', 5, 'May', 'michaelm1234', 
        'Michael', '', '2014-07-25', '1988-03-06', 'II');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '20064', '4827 Shoulder Center', 'f', 
        'DC', 'Washington', '', 'District of columbia', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999357038', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999371688', 8, 'Ellison', 'done1234', 
        'Don', 'John', '2015-08-09', '1999-10-26', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '20643', '1298 Golden Speed Hills', 't', 
        'MD', 'Ironsides', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999371688', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999312757', 4, 'Hughes', 'josephh1234', 
        'Joseph', 'Bryant', '2011-10-13', '1998-05-13', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '48613', '9736 Profitable Wine Spring', 'f', 
        'MI', 'Bentley', '', 'Bay', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999312757', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999399015', 8, 'Turner', 'cristinat1234', 
        'Cristina', 'Karen', '2008-07-15', '1985-12-10', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '45844', '6445 Turkish Strike Shoal', 't', 
        'OH', 'Fort jennings', '', 'Putnam', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999399015', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999313973', 4, 'Langley', 'victorl1234', 
        'Victor', 'James', '2011-04-02', '1993-01-09', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '94576', '1082 Capacity Hill', 'f', 
        'CA', 'Deer park', '', 'Napa', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999313973', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999311521', 6, 'Fields', 'davidf1234', 
        'David', '', '2013-09-03', '1990-08-11', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '73939', '8788 Religious Writer Isle', 'f', 
        'OK', 'Goodwell', '', 'Texas', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999311521', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999388816', 7, 'Hoffman', 'gregoryh1234', 
        'Gregory', 'Thomas', '2012-11-04', '1999-11-13', 'II');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '47163', '4971 Assembly Parkways', 'f', 
        'IN', 'Otisco', '', 'Clark', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999388816', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999345160', 8, 'Gonzalez', 'natalieg1234', 
        'Natalie', 'Joan', '2007-10-22', '1991-04-11', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '17120', '8835 Amazing Reduction Course', 'f', 
        'PA', 'Harrisburg', '', 'Dauphin', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999345160', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999328966', 9, 'Rucker', 'drewr1234', 
        'Drew', '', '2007-03-23', '1965-12-19', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '92253', '5158 Redundant Reality Creek', 'f', 
        'CA', 'La quinta', '', 'Riverside', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999328966', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999394635', 9, 'Mitchell', 'kimberlym1234', 
        'Kimberly', '', '2013-01-02', '1971-02-19', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '85375', '9724 Land Corner', 'f', 
        'AZ', 'Sun city west', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999394635', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999333308', 7, 'Murray', 'heatherm1234', 
        'Heather', 'Margaret', '2013-08-18', '1969-05-21', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '51239', '5555 Project Bypass', 'f', 
        'IA', 'Hull', '', 'Sioux', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999333308', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999316647', 7, 'Sosa', 'robertas1234', 
        'Roberta', 'Norma', '2011-08-18', '1962-09-02', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '94010', '4571 Jealous Comparison Wells', 'f', 
        'CA', 'Burlingame', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999316647', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999389066', 4, 'Ramos', 'annetter1234', 
        'Annette', 'Angela', '2006-05-06', '1967-11-04', 'II');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '29621', '9196 Old Future Fort', 'f', 
        'SC', 'Anderson', '', 'Anderson', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999389066', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999380162', 8, 'Jackson', 'paulj1234', 
        'Paul', '', '2015-10-14', '1969-05-16', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '77651', '9869 Convention Pine', 't', 
        'TX', 'Port neches', '', 'Jefferson', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999380162', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999318240', 7, 'Graham', 'johng1234', 
        'John', 'Charles', '2007-05-15', '1998-12-23', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '03216', '3676 Sweet Campaign Courts', 'f', 
        'NH', 'Andover', '', 'Merrimack', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999318240', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999347267', 7, 'Michael', 'adamm1234', 
        'Adam', 'John', '2015-09-03', '1966-09-18', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '68113', '7244 Brief Tree Crescent', 'f', 
        'NE', 'Offutt a f b', '', 'Sarpy', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999347267', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999344618', 7, 'Thomas', 'helent1234', 
        'Helen', '', '2006-03-27', '1998-07-15', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '43534', '5066 Disabled Drink Ford', 'f', 
        'OH', 'Mc clure', '', 'Henry', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999344618', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999301966', 7, 'Rivas', 'meghanr1234', 
        'Meghan', '', '2007-11-21', '1977-08-22', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '48328', '1604 Other Factor Harbor', 't', 
        'MI', 'Waterford', '', 'Oakland', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999301966', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999306663', 5, 'Hurst', 'williamh1234', 
        'William', 'Ian', '2011-10-24', '1995-03-27', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '76937', '7986 Line Grove', 'f', 
        'TX', 'Eola', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999306663', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999329410', 8, 'Bridges', 'kimberlyb1234', 
        'Kimberly', 'Anna', '2014-04-19', '1981-01-13', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '21047', '9992 Show Village', 'f', 
        'MD', 'Fallston', '', 'Harford', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999329410', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999396820', 6, 'Stewart', 'beatrices1234', 
        'Beatrice', 'Gloria', '2015-02-04', '1966-12-25', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '64123', '7373 Social Fact Roads', 'f', 
        'MO', 'Kansas city', '', 'Jackson', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999396820', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999398998', 7, 'Welsh', 'alejandraw1234', 
        'Alejandra', 'Christine', '2009-03-24', '1973-11-18', 'III');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '91615', '4270 Deafening Speed Stream', 'f', 
        'CA', 'North hollywood', '', 'Los angeles', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999398998', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999308688', 9, 'Osborne', 'leonao1234', 
        'Leona', '', '2014-01-10', '1999-04-08', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '65261', '1368 Defiant Visit Drive', 'f', 
        'MO', 'Keytesville', '', 'Chariton', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999308688', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999321465', 4, 'Sinclair', 'luellas1234', 
        'Luella', 'Carole', '2015-04-06', '1993-10-15', 'II');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '45314', '3011 Thoughtful Law Terrace', 'f', 
        'OH', 'Cedarville', '', 'Greene', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999321465', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999399294', 5, 'Jones', 'joej1234', 
        'Joe', 'Wayne', '2006-09-23', '1963-12-20', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '12167', '1641 Jolly Period Bend', 'f', 
        'NY', 'Stamford', '', 'Delaware', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999399294', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999355645', 6, 'Duncan', 'willied1234', 
        'Willie', '', '2009-12-11', '1971-09-27', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '34682', '9904 Australian Cash Squares', 'f', 
        'FL', 'Palm harbor', '', 'Pinellas', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999355645', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999359616', 6, 'Carney', 'andreac1234', 
        'Andrea', '', '2008-11-16', '1989-04-18', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '23442', '9706 Jealous Alternative Fort', 't', 
        'VA', 'Temperanceville', '', 'Accomack', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999359616', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999359143', 9, 'Hunt', 'howardh1234', 
        'Howard', 'Ralph', '2011-06-06', '1971-05-09', 'Jr');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '49337', '1182 Radical Letter Square', 'f', 
        'MI', 'Newaygo', '', 'Newaygo', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999359143', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999389009', 6, 'Martin', 'eddiem1234', 
        'Eddie', 'Anthony', '2007-11-07', '1997-12-09', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '95031', '1938 Fundamental Distribution Lane', 'f', 
        'CA', 'Los gatos', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999389009', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999327461', 9, 'Barry', 'paulb1234', 
        'Paul', 'Richard', '2014-06-04', '1974-04-16', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '40583', '9317 Testy Soil Place', 'f', 
        'KY', 'Lexington', '', 'Fayette', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999327461', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999319193', 7, 'Wright', 'dennisw1234', 
        'Dennis', 'Jimmie', '2014-12-16', '1992-09-05', 'II');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '24925', '7338 Drab Development Underpass', 't', 
        'WV', 'Caldwell', '', 'Greenbrier', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999319193', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999378520', 5, 'Saunders', 'rubens1234', 
        'Ruben', 'Eric', '2011-06-25', '1975-06-22', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '32648', '2941 Conservation Race Haven', 'f', 
        'FL', 'Horseshoe beach', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999378520', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999366196', 7, 'Lane', 'jenniferl1234', 
        'Jennifer', '', '2008-05-23', '1961-10-22', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '12456', '5547 Knee Underpass', 'f', 
        'NY', 'Mount marion', '', 'Ulster', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999366196', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999324371', 5, 'Madden', 'jom1234', 
        'Jo', 'Mae', '2013-02-14', '1976-04-01', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '19612', '3125 League Brook', 'f', 
        'PA', 'Reading', '', 'Berks', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999324371', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999316280', 8, 'Harding', 'naomih1234', 
        'Naomi', 'Julie', '2006-09-02', '1986-05-21', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '93021', '6693 Thin Entry Lake', 't', 
        'CA', 'Moorpark', '', 'Ventura', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999316280', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999388575', 5, 'Davis', 'blaked1234', 
        'Blake', 'George', '2009-06-26', '1977-06-17', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '13856', '8634 Need Bridge', 'f', 
        'NY', 'Walton', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999388575', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999336610', 4, 'Barnes', 'normab1234', 
        'Norma', 'Gail', '2009-11-01', '1983-01-09', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '23107', '218 Region River', 'f', 
        'VA', 'Maryus', '', 'Gloucester', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999336610', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999376864', 4, 'Anderson', 'leona1234', 
        'Leon', '', '2013-05-24', '1986-09-16', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '27315', '9834 Standard Stravenue', 'f', 
        'NC', 'Providence', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999376864', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999391951', 7, 'Gillespie', 'mistyg1234', 
        'Misty', 'Margaret', '2008-10-12', '1993-10-19', 'III');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '47273', '4151 Severe Look Fort', 'f', 
        'IN', 'Scipio', '', 'Jennings', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999391951', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999368950', 7, 'Santos', 'esthers1234', 
        'Esther', 'Mary', '2009-11-08', '1961-12-17', 'Sr');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '06468', '2774 Melted Stone Islands', 'f', 
        'CT', 'Monroe', '', 'Fairfield', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999368950', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999343281', 7, 'Bradley', 'rebeccab1234', 
        'Rebecca', 'Vanessa', '2009-03-06', '1991-04-25', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '66948', '5933 Changing Terms Pike', 'f', 
        'KS', 'Jamestown', '', 'Cloud', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999343281', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999394534', 4, 'Hart', 'victorh1234', 
        'Victor', '', '2006-07-04', '1977-01-10', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '16833', '677 Breezy Agreement Mountain', 'f', 
        'PA', 'Curwensville', '', 'Clearfield', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999394534', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999323404', 8, 'Riley', 'edwardr1234', 
        'Edward', 'Lonnie', '2010-10-06', '1992-07-19', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '84412', '5806 Metropolitan Problem Annex', 'f', 
        'UT', 'Ogden', '', 'Weber', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999323404', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999375760', 5, 'Jordan', 'michellej1234', 
        'Michelle', '', '2014-12-09', '1973-05-07', 'III');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '46970', '8951 Great Arrangement Mills', 'f', 
        'IN', 'Peru', '', 'Miami', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999375760', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999315742', 7, 'Brown', 'maryb1234', 
        'Mary', 'Jill', '2009-12-19', '1973-11-10', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '75663', '4845 Boat Course', 'f', 
        'TX', 'Kilgore', '', 'Gregg', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999315742', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999322514', 7, 'Barber', 'shawnb1234', 
        'Shawn', 'Thomas', '2013-06-22', '1988-10-21', 'II');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '98464', '7111 Accurate Talk Canyon', 't', 
        'WA', 'Tacoma', '', 'Pierce', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999322514', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999342144', 8, 'Harrison', 'williamh1234', 
        'William', 'Phillip', '2008-09-15', '1990-04-09', 'II');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '79085', '9798 Marked West Fork', 't', 
        'TX', 'Summerfield', '', 'Castro', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999342144', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999320546', 7, 'Porter', 'darlenep1234', 
        'Darlene', 'Lisa', '2015-07-15', '1987-02-23', 'Jr');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '24910', '3522 Channel Radial', 'f', 
        'WV', 'Alderson', '', 'Monroe', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999320546', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999315474', 8, 'Lopez', 'joycel1234', 
        'Joyce', 'Donna', '2010-02-06', '1980-06-28', 'Sr');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '89101', '9734 Civilian Position Hollow', 'f', 
        'NV', 'Las vegas', '', 'Clark', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999315474', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999371586', 9, 'Stevenson', 'larrys1234', 
        'Larry', '', '2013-04-25', '1990-12-20', 'Sr');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '46241', '5799 Constitutional Roof Groves', 'f', 
        'IN', 'Indianapolis', '', 'Marion', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999371586', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999329832', 4, 'Kinney', 'nicholask1234', 
        'Nicholas', '', '2009-02-19', '1989-05-24', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '90606', '411 Preliminary Library Square', 't', 
        'CA', 'Whittier', '', 'Los angeles', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999329832', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999342948', 5, 'Bernard', 'omarb1234', 
        'Omar', 'David', '2013-01-04', '1981-08-19', 'Jr');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '41567', '2546 Marvellous Index Ways', 'f', 
        'KY', 'Stone', '', 'Pike', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999342948', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999335091', 9, 'Brown', 'maryb1234', 
        'Mary', 'Annie', '2006-04-28', '1978-04-02', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '07630', '48 Look Ridge', 'f', 
        'NJ', 'Emerson', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999335091', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999303411', 8, 'Smith', 'sarahs1234', 
        'Sarah', '', '2006-03-23', '1990-01-13', 'II');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '34972', '845 Relative Dress Mall', 'f', 
        'FL', 'Okeechobee', '', 'Okeechobee', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999303411', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999327083', 8, 'Jones', 'coraj1234', 
        'Cora', '', '2009-09-18', '1968-06-08', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '65262', '9202 Tight Subject Highway', 'f', 
        'MO', 'Kingdom city', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999327083', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999300523', 7, 'Little', 'shawnl1234', 
        'Shawn', 'Joseph', '2008-11-13', '1991-01-11', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '86343', '8169 Vast Passage Key', 'f', 
        'AZ', 'Crown king', '', 'Yavapai', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999300523', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999328829', 6, 'Thurman', 'luannt1234', 
        'Luann', 'Donna', '2008-05-19', '1990-08-19', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '63463', '1967 Interesting Court Ford', 'f', 
        'MO', 'Philadelphia', '', 'Marion', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999328829', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999394673', 6, 'Scott', 'patricias1234', 
        'Patricia', 'Robin', '2008-11-08', '1998-08-28', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '44241', '8955 Due Population Alley', 'f', 
        'OH', 'Streetsboro', '', 'Portage', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999394673', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999355318', 5, 'Lamb', 'esperanzal1234', 
        'Esperanza', 'Beth', '2013-07-17', '1995-06-13', 'III');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '05501', '9042 Just Show Turnpike', 'f', 
        'MA', 'Andover', '', 'Essex', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999355318', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999377675', 8, 'Brown', 'wendib1234', 
        'Wendi', 'Mary', '2012-09-21', '1996-10-12', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '37721', '7546 Rude Agreement Highway', 'f', 
        'TN', 'Corryton', '', 'Knox', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999377675', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999363186', 5, 'Clarke', 'lawrencec1234', 
        'Lawrence', 'Vern', '2015-01-10', '1982-05-20', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '76234', '7903 Surprised Rule Loop', 'f', 
        'TX', 'Decatur', '', 'Wise', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999363186', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999346314', 8, 'Clark', 'danielc1234', 
        'Daniel', 'Ricky', '2009-08-24', '1989-08-25', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '70706', '8604 Defensive Case Trace', 't', 
        'LA', 'Denham springs', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999346314', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999353477', 6, 'Dennis', 'johnd1234', 
        'John', 'Robert', '2012-04-16', '1986-12-08', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '14480', '8712 Legislative Box Shore', 'f', 
        'NY', 'Lakeville', '', 'Livingston', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999353477', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999312358', 4, 'Copeland', 'janc1234', 
        'Jan', 'Lindsey', '2015-08-08', '1998-06-14', 'Jr');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 'f', '83204', '6713 River Bridge', 'f', 
        'ID', 'Pocatello', '', 'Bannock', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999312358', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999360839', 8, 'Brooks', 'pennyb1234', 
        'Penny', 'Martha', '2013-11-28', '1980-03-13', 'II');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '79120', '8208 Death Ramp', 'f', 
        'TX', 'Amarillo', '', 'Potter', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999360839', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999342446', 8, 'Johnson', 'jeannej1234', 
        'Jeanne', '', '2008-10-16', '1974-12-14', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '85036', '9634 Tough Division Junction', 't', 
        'AZ', 'Phoenix', '', '', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999342446', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 1, '99999358416', 4, 'Sanford', 'elizabeths1234', 
        'Elizabeth', 'Vanessa', '2011-11-21', '1960-12-04', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '98357', '6767 Application Course', 'f', 
        'WA', 'Neah bay', '', 'Clallam', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999358416', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');


INSERT INTO actor.usr 
    (profile, ident_type, usrname, home_ou, family_name, passwd, first_given_name, second_given_name, expire_date, dob, suffix) 
    VALUES (2, 3, '99999361389', 9, 'Ramirez', 'alanr1234', 
        'Alan', 'Claude', '2008-12-02', '1984-10-16', '');

INSERT INTO actor.usr_address 
    (country, within_city_limits, post_code, street1, valid, state, city, street2, county, usr) 
    VALUES ('USA', 't', '76060', '9964 Skinny Party Orchard', 't', 
        'TX', 'Kennedale', '', 'Tarrant', CURRVAL('actor.usr_id_seq'));

INSERT INTO actor.card (barcode, usr) 
    VALUES ('99999361389', CURRVAL('actor.usr_id_seq'));

UPDATE actor.usr SET 
    card = CURRVAL('actor.card_id_seq'), 
    billing_address = CURRVAL('actor.usr_address_id_seq'), 
    credit_forward_balance = '0', 
    mailing_address = CURRVAL('actor.usr_address_id_seq') 
    WHERE id=CURRVAL('actor.usr_id_seq');

COMMIT;
