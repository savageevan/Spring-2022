use sakila;

----- 1
SELECT payment_id, customer_id, amount, date(payment_date)
FROM payment
WHERE customer_id <> 5 AND (amount > 8 OR date(payment_date) = '2005-08-23');
----- 107 & 101
----- 2 

----- All except 109 and 114

----- 3
SELECT *
FROM payment
WHERE amount = 1.98 OR amount = 7.98 OR amount = 9.98;

-- Question 4

SELECT last_name
FROM customer
WHERE last_name LIKE "_A%W%";

SELECT last_name
FROM customer
WHERE last_name LIKE "_E%";
