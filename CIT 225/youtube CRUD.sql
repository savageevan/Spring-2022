use youtube;

-- what is the account type?
INSERT INTO account (account_id, account_firstname, account_lastname, account_username, account_email, account_typel)
VALUES(DEFAULT, "Evan", "Savage", "savageevan", "evan@gmail.com", 1);

INSERT INTO account (account_id, account_firstname, account_lastname, account_username, account_email, account_typel)
VALUES(DEFAULT, "Daniel", "Gomez", "danielgomez", "daniel@gmail.com", 1);

INSERT INTO account (account_id, account_firstname, account_lastname, account_username, account_email, account_typel)
VALUES(DEFAULT, "Johnny", "Prater", "praterjohnny", "johnny@gmail.com", 1);

-- change id to auto-increment
INSERT INTO lookup (lookup_id, lookup_type, lookup_value, account_id, start_date)
VALUES(1, "test", "test1", 1, "2000-01-01");

-- change id to auto-increment, membership type to character
INSERT INTO memberships (memberships_id, lookup_id, membership_type)
VALUES(1, 1, 1);

-- what is subscription telling us?
INSERT INTO subscription (account_account_id, subscription_id, lookup_lookup_id)
VALUES(1, DEFAULT, 1);

-- change id to auto_increment
INSERT INTO channel (channel_id, lookup_lookup_id, channel_name, channel_type, channel_creators)
VALUES(1, 1, "The bois", "SQL class", "Evan, Daniel, and Johnny");

INSERT INTO video (videos_id, chanel_channel_id, video_name, video_length, video_date, account_video_reaction_likedvideos_id)

INSERT INTO 

SELECT *
FROM channel;
