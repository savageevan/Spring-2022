use youtube;

SELECT * FROM lookup;
SELECT * FROM account;

INSERT INTO account 
(account_id, account_firstname, account_lastname, account_username, account_email, lookup_id, start_date)
VALUES (DEFAULT, 'John', 'Prater', 'SeahawksFan12', 'pra19006@byui.edu', 1, "2015-08-21");

INSERT INTO account 
(account_id, account_firstname, account_lastname, account_username, account_email, lookup_id, lookup_id_1, start_date)
VALUES (DEFAULT, 'Evan', 'Savage', 'BiggestMCRfan', 'evan@gamil.com', 1, 2, "2012-01-01");

INSERT INTO account 
(account_id, account_firstname, account_lastname, account_username, account_email, lookup_id, lookup_id_1, lookup_id_2, start_date, end_date)
VALUES (DEFAULT, 'Daniel', 'Son', 'Karate Tutorials', 'ilikekarate@gamil.com', 1,2,3, "2020-05-12", "2022-02-02");

INSERT INTO account 
(account_id, account_firstname, account_lastname, account_username, account_email, lookup_id, start_date)
VALUES (DEFAULT, 'Michael', 'McLaughlin', 'ORACLE IS THE BEST', 'teacher7@gmail.com', 1, "2012-12-12");

INSERT INTO account 
(account_id, account_firstname, account_lastname, account_username, account_email, lookup_id, start_date)
VALUES (DEFAULT, 'Kim', 'Sam', 'Makeup Tutorial', 'makeups@gmail.com', 1, "2013-09-30");

INSERT INTO account 
(account_id, account_firstname, account_lastname, account_username, account_email, lookup_id, start_date)
VALUES (DEFAULT, 'Tim', 'Man', 'Jungle Adventures', 'flame@gmail.com', 1, "2006-03-03");

INSERT INTO lookup
(lookup_id, lookup_value, lookup_type)
VALUES(DEFAULT, 'Standard', 'account');

INSERT INTO lookup 
(lookup_id, lookup_value, lookup_type)
VALUES (DEFAULT, 'Premium', 'account');

INSERT INTO lookup 
(lookup_id, lookup_value, lookup_type)
VALUES (DEFAULT, 'Youtube TV', 'account');

INSERT INTO lookup 
(lookup_id, lookup_value, lookup_type)
VALUES (DEFAULT, 'Music', 'account');

INSERT INTO lookup 
(lookup_id, lookup_value, lookup_type)
VALUES (DEFAULT, 'Like', 'Video Reaction');

INSERT INTO lookup 
(lookup_id, lookup_value, lookup_type)
VALUES (DEFAULT, 'Dislike', 'Video Reaction');

INSERT INTO lookup 
(lookup_id, lookup_value, lookup_type)
VALUES (DEFAULT, 'Like', 'Video Reaction');

INSERT INTO lookup 
(lookup_id, lookup_value, lookup_type)
VALUES (DEFAULT, 'Gaming', 'Channel');

INSERT INTO lookup 
(lookup_id, lookup_value, lookup_type)
VALUES (DEFAULT, 'Tetris', 'Channel');

INSERT INTO lookup 
(lookup_id, lookup_value, lookup_type)
VALUES (DEFAULT, 'Paper Products', 'Channel');

INSERT INTO lookup 
(lookup_id, lookup_value, lookup_type)
VALUES (DEFAULT, 'Hardware', 'Channel');

INSERT INTO lookup 
(lookup_id, lookup_value, lookup_type)
VALUES (DEFAULT, 'News', 'Channel');

INSERT INTO creator
(first_name, last_name)
VALUES ('Yah', 'Boi');

INSERT INTO creator
(first_name, last_name)
VALUES ('Durk', 'Makurt');

INSERT INTO creator 
(first_name, last_name)
VALUES ('Tim', 'Smith');

INSERT INTO creator 
(first_name, last_name)
VALUES ('Kim', 'Wright');

INSERT INTO creator 
(first_name, last_name)
VALUES ('Ty', 'Burp');

INSERT INTO creator 
(first_name, last_name)
VALUES ('Evan', 'Savage');

INSERT INTO creator 
(first_name, last_name)
VALUES ('Daniel', 'Gomez');

INSERT INTO creator 
(first_name, last_name)
VALUES ('John', 'Prater');

SELECT a.account_id, a.account_firstname, a.account_lastname, l.lookup_id, l.lookup_id_1, l.lookup_id_2
FROM account a
LEFT JOIN lookup l
	ON a.lookup_id = l.lookup_id
WHERE l.lookup_value = "Premium";











