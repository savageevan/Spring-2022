DROP TABLE IF EXISTS a, b;

CREATE TABLE a (text varchar(1));
CREATE TABLE b (text varchar(1));

INSERT INTO a (text) VALUES ("L"), ("M"), ("N"), ("O"), ("P");
INSERT INTO B (text) VALUES ("P"), ("Q"), ("R"), ("S"), ("T");

use sakila;

--- Question 2
SELECT a.first_name, a.last_name
FROM actor a
WHERE last_name LIKE "L%"
UNION
SELECT c.first_name, c.last_name
FROM customer c
WHERE last_name LIKE "L%";

--- Question 3
SELECT a.first_name, a.last_name
FROM actor a
WHERE last_name LIKE "L%"
UNION
SELECT c.first_name, c.last_name
FROM customer c
WHERE last_name LIKE "L%"
ORDER BY last_name;

--- Question 4
SELECT c.city_id AS id, c.city AS name
FROM city c
WHERE c.city LIKE "S%o%a"
UNION ALL
SELECT co.country_id AS id, co.country AS name
FROM country co
WHERE co.country LIKE "S%o%a";

--- Question 5
SELECT c.city_id AS id, c.city AS name
FROM city c
WHERE c.city LIKE "S%o%a"
UNION ALL
SELECT co.country_id AS id, co.country AS name
FROM country co
WHERE co.country LIKE "S%o%a"
ORDER BY name;
 
 --- Question 6
SELECT a.first_name, a.last_name, f.title
FROM actor a INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id INNER JOIN film f
ON fa.film_id = f.film_id
WHERE a.first_name LIKE "M%" AND f.title LIKE "LOVE%"
UNION
SELECT a.first_name, a.last_name, f.title
FROM actor a INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id INNER JOIN film f
ON fa.film_id = f.film_id
WHERE a.last_name LIKE "W%" AND f.title LIKE "LIFE%"
ORDER BY last_name;

--- Question 7
SELECT a.last_name, f.title
FROM actor a INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id INNER JOIN film f
ON fa.film_id = f.film_id
WHERE a.first_name LIKE "M%" AND f.title LIKE "LOVE%"
UNION
SELECT a.last_name, f.title
FROM actor a INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id INNER JOIN film f
ON fa.film_id = f.film_id
WHERE a.last_name LIKE "W%" AND f.title LIKE "LIFE%"
ORDER BY last_name;


