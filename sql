-- 1. Retrieve the total number of rentals made in the Sakila database
select count(*) from rental;

-- 2. Find the average rental duration (in days) of movies rented from the Sakila database.
select avg(rental_duration) from film;

-- 3.Display the first name and last name of customers in uppercase. 
select concat(upper(first_name)," ",upper(last_name)) as Name_ from customer;

-- 4.Extract the month from the rental date and display it alongside the rental ID
select month(rental_date) from rental;

-- 5.Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
SELECT customer_id,  COUNT(*) AS rental_count FROM rental group by customer_id;

-- 6.Find the total revenue generated by each store. 
select store_id,count(*) from customer group by store_id;


-- 7. Display the title of the movie, customer's first name, and last name who rented it. 
-- Use JOIN between the film, inventory, rental, and customer tables
select  first_name,last_name,title
from film f
join inventory i
on  f.film_id=i.film_id
join rental r
on i.inventory_id=r.inventory_id
join customer c
on r.customer_id=c.customer_id;


-- 8.Retrieve the names of all actors who have appeared in the film "Gone trouble."

select first_name,last_name,title
from  actor a
join film_actor b
on  a.actor_id=b.actor_id
join film c
on b.film_id=c.film_id
where title ='Gone with the Wind';

-- 9.Determine the total number of rentals for each category of movies. 
select category_id, count(rental_id)
from
film_category fa
join inventory i
on fa.film_id=i.film_id
join rental r
on i.inventory_id=r.inventory_id
group by category_id;

-- 10.Find the average rental rate of movies in each language
select name ,avg(rental_rate)
from film f
join language l
on f.language_id=l.language_id
group by f.language_id;

-- 11.Retrieve the customer names along with the total amount they've spent on rentals
select first_name,last_name, sum(amount) as rental_amount
from customer c
join payment p
on c.customer_id=p.customer_id
join rental r
on r.customer_id=p.customer_id
group by p.customer_id;


-- 12.List the titles of movies rented by each customer in a particular city (e.g., 'London'). 
select title,c.customer_id,  ci.city
from film f 
join inventory i
on f.film_id=i.film_id 
join rental r
on i.inventory_id=r.inventory_id 
join customer c
on c.customer_id=r.customer_id 
join address a
on c.address_id=a.address_id 
join city ci
on a.city_id=ci.city_id;


-- 13.List the titles of movies rented by each customer in a particular city (e.g., 'London'). 
-- Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY. 

select title,c.customer_id,  ci.city
from film f 
join inventory i
on f.film_id=i.film_id 
join rental r
on i.inventory_id=r.inventory_id 
join customer c
on c.customer_id=r.customer_id 
join address a
on c.address_id=a.address_id 
join city ci
on a.city_id=ci.city_id;

-- 14.Display the top 5 rented movies along with the number of times they've been rented. 
select title,count(rental_id)  rental_count
from film f
join inventory i
on f.film_id=i.film_id
join rental r
on r.inventory_id=i.inventory_id
group by title
order by rental_count desc
limit 5;
