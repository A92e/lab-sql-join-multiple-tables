
use sakila;

-- Lab | SQL Joins on multiple tables



   -- 1- Write a query to display for each store its store ID, city, and country.
    
    
    select s.store_id, city.city, c.country from store s
    left join address a
    on s.address_id=a.address_id
    join city
    on a.city_id=city.city_id
    join country c 
    on city.country_id=c.country_id
    group by store_id
    order by store_id;
    
    
    
    
    -- 2- Write a query to display how much business, in dollars, each store brought in.
    
    select s.store_id, sum(p.amount) as 'amount' from store s
    left join staff 
    on s.store_id=staff.store_id
    left join payment p
    on staff.staff_id=p.staff_id
    group by s.store_id
    order by s.store_id;
    
    
    -- 3- What is the average running time of films by category?
    
    select c.name,round(avg(f.length)) as'avg_length' from category c
    left join film_category fc
    on c.category_id=fc.category_id
    join film f
    on fc.film_id=f.film_id
    group by c.name
    order by c.name;
    
    
    
    
    -- 4- Which film categories are longest?
    
    select c.name,round(avg(f.length)) as'avg_length' from category c
    left join film_category fc
    on c.category_id=fc.category_id
    join film f
    on fc.film_id=f.film_id
    group by c.name
    order by  round(avg(f.length)) desc;
    
        
    
    -- 5- Display the most frequently rented movies in descending order.
    
    select f.title, count(r.rental_id)  as num_rental from film f
    left join inventory i
    on f.film_id=i.film_id
    join rental r
    on i.inventory_id=r.inventory_id
    group by f.title
    order by num_rental desc;
    
    
    
    
    
    -- 6- List the top five genres in gross revenue in descending order.
    
    select c.name, sum(p.amount) as 'revenue' from category c
    join film_category fc
    on c.category_id=fc.category_id
    join inventory i
    on fc.film_id=i.film_id
    join rental r
    on i.inventory_id=r.inventory_id
    join payment p
    on r.rental_id=p.rental_id
    group by c.name
    order by sum(p.amount) desc
    limit 5;
    
    
    
    
-- 7- Is "Academy Dinosaur" available for rent from Store 1?

select f.title, i.store_id, count(f.title) as 'num_inv' from film f
join inventory i
on f.film_id=i.film_id
join store s
on i.store_id=s.store_id
where  f.title="Academy Dinosaur" and s.store_id=1;

