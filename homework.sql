-- 1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name, customer.address_id, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- Jennifer Davis
-- Kim Cruz
-- Richard Mccrary
-- Bryan Hardison
-- Ian Still





--  2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;
-- 32


-- 3. Show all customers names who have made payments over $175(use subqueries) 
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);
-- Mary Smith
-- Peter Menard


-- 4. List all customers that live in Nepal (use the city table)  
SELECT first_name, last_name
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';
-- Kevin Schuler


-- 5. Which staff member had the most transactions?  
SELECT first_name, last_name
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
WHERE staff.staff_id = 2;
-- Jon Stephens 7304 transactions


-- 6. How many movies of each rating are there?  
SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;
-- PG-13 w/ 224


-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries) 
SELECT payment.amount, customer.first_name, customer.last_name
FROM payment
INNER JOIN customer ON payment.customer_id=customer.customer_id
WHERE amount > 6.99;


-- 8. How many free rentals did our stores give away? 
SELECT amount
FROM payment
WHERE amount < 0;
--14,565