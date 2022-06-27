use sakila;

SELECT name,
	CASE
		WHEN name IN ("English", "Italian", "French", "German")
			THEN "latin1"
		WHEN name IN ("Japanese", "Mandarin")
			THEN "utf8"
		ELSE "Unknown"
	END character_set
FROM language;

SELECT
 sum(CASE WHEN rating = "G" THEN 1 ELSE 0 END) g,
 sum(CASE WHEN rating = "PG" THEN 1 ELSE 0 END) pg,
 sum(CASE WHEN rating = "PG-13" THEN 1 ELSE 0 END) pg_13,
 sum(CASE WHEN rating = "R" THEN 1 ELSE 0 END) r,
 sum(CASE WHEN rating = "NC-17" THEN 1 ELSE 0 END) nc_17
FROM film;

SELECT 
	SUBSTR(last_name,1,1) starts_with, 
	SUM(CASE WHEN active = 1 THEN 1 ELSE 0 END) AS active_account, 
	SUM(CASE WHEN active = 0 THEN 1 ELSE 0 END) AS inactive_account
FROM customer
GROUP BY SUBSTR(last_name,1,1)
ORDER BY 1;


WITH letters as
( SELECT "A" AS letter
  UNION ALL
  SELECT "B" AS letter
  UNION ALL)
  ....
  SELECT "Z" AS letter
SELECT l.letter AS starts_with,
	SUM(CASE WHEN active = 1 THEN 1 ELSE 0 END) AS active_count,
	SUM(CASE WHEN active = 0 THEN 1 ELSE 0 END) AS inactive_count
FROM customer c RIGHT JOIN letters l
	ON SUBSTR(c.last_name,1,1) = l.letter
GROUP BY l.letter
ORDER BY l.letter;