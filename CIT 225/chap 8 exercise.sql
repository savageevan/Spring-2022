--- Q1
use sakila;
SELECT count(*) FROM payment;

--- Q2
SELECT customer_id, COUNT(*), SUM(amount)
FROM payment
GROUP BY customer_id;

--- Q3
SELECT customer_id, COUNT(*), SUM(amount)
FROM payment
GROUP BY customer_id
HAVING count(*) >= 40;	

--- Q4
SELECT f.title, f.rating, COUNT(*)
FROM film f 
	INNER JOIN film_actor fa
		ON f.film_id = fa.film_id
	INNER JOIN actor a
		ON fa.actor_id = a.actor_id
WHERE f.rating IN ("G", "PG", "PG-13")
GROUP BY f.title, f.rating
HAVING COUNT(*) BETWEEN 9 AND 12
ORDER BY f.title;

--- Q5
SELECT f.title, f.rating, COUNT(*)
FROM film f 
	INNER JOIN film_actor fa
		ON f.film_id = fa.film_id
	INNER JOIN actor a
		ON fa.actor_id = a.actor_id
WHERE f.title LIKE "C%"
GROUP BY f.title, f.rating
HAVING COUNT(*) BETWEEN 9 AND 12
ORDER BY f.title;
