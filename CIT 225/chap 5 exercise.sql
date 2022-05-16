use sakila;

SELECT c.first_name, c.last_name, a.address, ct.city
FROM customer c
	INNER JOIN address a
	ON c.address_id = a.address_id
	INNER JOIN city ct
	ON a.city_id = ct.city_id
WHERE a.district = "California";

SELECT f.title
FROM film f
	INNER JOIN film_actor fa
	ON f.film_id = fa.film_id
	INNER JOIN actor a
	ON fa.actor_id = a.actor_id
WHERE a.first_name = 'JOHN';

SELECT a1.address addr1, a2.address addr2, a1.city_id
	FROM address a1
	INNER JOIN address a2
 WHERE a1.city_id = a2.city_id
 AND a1.address_id <> a2.address_id;
 
 SELECT f.title, f.length
 FROM film f
	INNER JOIN film_actor fa
    ON f.film_id = fa.film_id
    INNER JOIN actor a
    ON fa.actor_id = a.actor_id
WHERE a.first_name = "Joe" AND a.last_name = "Swank" AND f.length BETWEEN 90 AND 120;

SELECT s.first_name, s.last_name
FROM staff s
	INNER JOIN rental r
    ON s.staff_id = r.staff_id
GROUP BY s.first_name, s.last_name;
