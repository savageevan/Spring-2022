use sakila;

--- Q1
SELECT title
FROM film
WHERE film_id IN
	(SELECT fc.film_id
	 FROM film_category AS fc
		INNER JOIN category AS c
			ON fc.category_id = c.category_id
	 WHERE c.name = "Action");
     
--- Q2
SELECT f.title
FROM film AS f
WHERE EXISTS
	(SELECT 1
     FROM film_category AS fc 
		INNER JOIN category AS c
			ON fc.category_id = c.category_id
	 WHERE c.name = "Action" 
		AND fc.film_id = f.film_id);
        
--- Q3
SELECT actr.actor_id, grps.level
FROM
	(SELECT actor_id, count(*) num_roles
     FROM film_actor
     GROUP BY actor_id) AS actr
     INNER JOIN
	(SELECT "Hollywood Star" level, 30 min_roles, 99999 max_roles
     UNION ALL
     SELECT "Prolific Actor" level, 20 min_roles, 29 max_roles
     UNION ALL
     SELECT "Newcomer" level, 1 min_roles, 19 max_roles) AS grps
ON actr.num_roles BETWEEN grps.min_roles AND grps.max_roles;

--- Q4
SELECT fa.actor_id, fa.film_id
FROM film_actor fa
WHERE (fa.actor_id, fa.film_id) IN 
	(SELECT a.actor_id, f.film_id
     FROM actor a CROSS JOIN film f
     WHERE last_name = "MONROE" AND rating = "PG");
     

--- Q5
SELECT fa.actor_id, fa.film_id
FROM film_actor fa
WHERE EXISTS
	(SELECT null
     FROM actor a
     WHERE a.last_name = "MONROE" AND a.actor_id = fa.actor_id)
AND EXISTS
	(SELECT null
     FROM film f
     WHERE f.rating = "PG" AND f.film_id = fa.film_id);