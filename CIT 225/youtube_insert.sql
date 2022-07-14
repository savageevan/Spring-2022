use youtube;

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

INSERT INTO lookup
(lookup_id, lookup_value, lookup_type)
VALUES (DEFAULT, 'Standard', "video");

INSERT INTO lookup
(lookup_id, lookup_value, lookup_type)
VALUES (DEFAULT, 'Reels', "video");

INSERT INTO lookup
(lookup_id, lookup_value, lookup_type)
VALUES (DEFAULT, 'Story', "video");

INSERT INTO user_info
(user_id, first_name, last_name, user_name, email)
VALUES(DEFAULT, 'John', 'Prater', 'SeahawksFan12', 'pra19006@byui.edu');

INSERT INTO user_info
(user_id, first_name, last_name, user_name, email)
VALUES (DEFAULT, 'Evan', 'Savage', 'BiggestMCRfan', 'evan@gamil.com');

INSERT INTO user_info
(user_id, first_name, last_name, user_name, email)
VALUES (DEFAULT, 'Daniel', 'Son', 'Karate Tutorials', 'ilikekarate@gamil.com');

INSERT INTO user_info
(user_id, first_name, last_name, user_name, email)
VALUES (DEFAULT, 'Michael', 'McLaughlin', 'ORACLE IS THE BEST', 'teacher7@gmail.com');

INSERT INTO user_info
(user_id, first_name, last_name, user_name, email)
VALUES (DEFAULT, 'Kim', 'Sam', 'Makeup Tutorial', 'makeups@gmail.com');

INSERT INTO user_info
(user_id, first_name, last_name, user_name, email)
VALUES (DEFAULT, 'Tim', 'Man', 'Jungle Adventures', 'flame@gmail.com');

INSERT INTO account
(user_id, lookup_id, start_date)
VALUES(1, 1, "2015-08-21");

INSERT INTO account
(user_id, lookup_id, start_date)
VALUES(1, 2, "2015-08-22");

INSERT INTO account
(user_id, lookup_id, start_date)
VALUES(2, 1, "2014-07-01");

INSERT INTO account
(user_id, lookup_id, start_date)
VALUES(3, 2, "2016-03-12");

INSERT INTO account
(user_id, lookup_id, start_date, end_date)
VALUES(3, 3, "2015-04-09", "2016-02-01");

INSERT INTO account
(user_id, lookup_id, start_date)
VALUES(4, 2, "2011-09-21");

INSERT INTO account
(user_id, lookup_id, start_date)
VALUES(4, 3, "2015-08-21");

INSERT INTO account
(user_id, lookup_id, start_date)
VALUES(4, 4, "2015-08-21");

INSERT INTO account
(user_id, lookup_id, start_date)
VALUES(5, 1, "2015-08-21");

INSERT INTO account
(user_id, lookup_id, start_date, end_date)
VALUES(5, 3, "2015-08-21", "2015-12-25");

INSERT INTO account
(user_id, lookup_id, start_date)
VALUES(6, 2, "2015-08-21");

INSERT INTO channel
(channel_id, lookup_id, channel_name, channel_creators)
VALUES(DEFAULT, 5, "the bois", "Johnny squad"); 

INSERT INTO channel
(channel_id, lookup_id, channel_name, channel_creators)
VALUES(DEFAULT, 7, "the gals", "Danny squad"); 

INSERT INTO channel
(channel_id, lookup_id, channel_name, channel_creators)
VALUES(DEFAULT, 8, "Hard Hats", "Evan Squad"); 

INSERT INTO video
(video_id, channel_id, lookup_id, video_name, video_length, video_date)
VALUES (DEFAULT, '1', '10', 'Karate Stikes', '00:41:21', '2020-07-04');

INSERT INTO video
(video_id, channel_id, lookup_id, video_name, video_length, video_date)
VALUES (DEFAULT, '2', '10', 'C+++ Tutorials', '00:10:51', '2021-04-03');

INSERT INTO video
(video_id, channel_id, lookup_id, video_name, video_length, video_date)
VALUES (DEFAULT, '3', '10', 'Crossroads Food Review', '00:23:00', '2021-08-08');

INSERT INTO video
(video_id, channel_id, lookup_id, video_name, video_length, video_date)
VALUES (DEFAULT, '1', '10', 'Mac vs Windows Debate', '4:00:00', '2021-08-03');

INSERT INTO video
(video_id, channel_id, lookup_id, video_name, video_length, video_date)
VALUES (DEFAULT, '2', '11', 'Russel Wilson Trade Reaction', '00:00:25', '2022-06-23');

INSERT INTO video
(video_id, channel_id, lookup_id, video_name, video_length, video_date)
VALUES (DEFAULT, '3', '10', 'Listening to Black Parade for 8 hrs straigth', '8:00:00', '2006-06-06');

INSERT INTO video
(video_id, channel_id, lookup_id, video_name, video_length, video_date)
VALUES (DEFAULT, '2', '12', 'Skirty Flirty Gurdie', '00:00:07', '2022-08-31');

INSERT INTO account_channel
(user_id, channel_id)
VALUES(1, 1);

INSERT INTO account_channel
(user_id, channel_id)
VALUES(2, 1);

INSERT INTO account_channel
(user_id, channel_id)
VALUES(1, 2);

INSERT INTO account_channel
(user_id, channel_id)
VALUES(3, 2);

INSERT INTO account_channel
(user_id, channel_id)
VALUES(2, 2);

INSERT INTO account_channel
(user_id, channel_id)
VALUES(5, 3);

INSERT INTO account_channel
(user_id, channel_id)
VALUES(6, 3);

INSERT INTO account_channel
(user_id, channel_id)
VALUES(4, 3);

INSERT INTO creator
(creator_id, creator_name, first_name, last_name)
VALUES (DEFAULT, "yahboi", 'Yah', 'Boi');

INSERT INTO creator
(creator_id, creator_name, first_name, last_name)
VALUES (DEFAULT, "durky", 'Durk', 'Makurt');

INSERT INTO creator 
(creator_id, creator_name, first_name, last_name)
VALUES (DEFAULT, "smithy man", 'Tim', 'Smith');

INSERT INTO creator 
(creator_id, creator_name, first_name, last_name)
VALUES (DEFAULT, "kim the cook", 'Kim', 'Wright');

INSERT INTO creator 
(creator_id, creator_name, first_name, last_name)
VALUES (DEFAULT, "ty by", 'Ty', 'Burp');

INSERT INTO creator 
(creator_id, creator_name, first_name, last_name)
VALUES (DEFAULT, "savage -_-", 'Evan', 'Savage');

INSERT INTO creator 
(creator_id, creator_name, first_name, last_name)
VALUES (DEFAULT, "danny boi", 'Daniel', 'Gomez');

INSERT INTO creator 
(creator_id, creator_name, first_name, last_name)
VALUES (DEFAULT, "the legend", 'John', 'Prater');

INSERT INTO channel_creator
(channel_id, creator_id)
VALUES(1 , 8);

INSERT INTO channel_creator
(channel_id, creator_id)
VALUES(1 , 1);

INSERT INTO channel_creator
(channel_id, creator_id)
VALUES(1 , 2);

INSERT INTO channel_creator
(channel_id, creator_id)
VALUES(2 , 7);

INSERT INTO channel_creator
(channel_id, creator_id)
VALUES(2 , 3);

INSERT INTO channel_creator
(channel_id, creator_id)
VALUES(2 , 4);

INSERT INTO channel_creator
(channel_id, creator_id)
VALUES(3 , 6);

INSERT INTO channel_creator
(channel_id, creator_id)
VALUES(3 , 5);









