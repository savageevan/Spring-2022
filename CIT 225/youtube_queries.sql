SELECT u.user_name, a.start_date, l.lookup_value
FROM user_info u
LEFT JOIN account a
	ON u.user_id = a.user_id
LEFT JOIN lookup l
	ON a.lookup_id = l.lookup_id;

SELECT c.channel_name, l.lookup_value
FROM channel c
JOIN lookup l
	ON c.lookup_id = l.lookup_id;

SELECT u.first_name, c.channel_name
FROM account_channel uc
JOIN user_info u
	ON uc.user_id = u.user_id
JOIN channel c
	ON uc.channel_id = c.channel_id;

SELECT cr.creator_name, cr.first_name, ch.channel_name
FROM channel_creator cc
JOIN creator cr
	ON cc.creator_id = cr.creator_id
JOIN channel ch
	ON cc.channel_id = ch.channel_id;