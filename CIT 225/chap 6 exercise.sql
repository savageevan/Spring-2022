DROP TABLE IF EXISTS a, b;

CREATE TABLE a (text varchar(1));
CREATE TABLE b (text varchar(1));

INSERT INTO a (text) VALUES ("L"), ("M"), ("N"), ("O"), ("P");
INSERT INTO B (text) VALUES ("P"), ("Q"), ("R"), ("S"), ("T");

SELECT text from a
EXCEPT
SELECT text from b;

use sakila;

SELECT a.first_name, a.last_name
FROM actor a
WHERE a.last_name LIKE "L%"
UNION ALL
SELECT c.first_name, c.last_name
FROM customer c
WHERE c.last_name LIKE "L%";

SELECT ct.city_id AS id, ct.city as name
FROM city ct;

