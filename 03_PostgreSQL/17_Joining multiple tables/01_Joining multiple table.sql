SELECT
	movie_id,
	movie_name,
	movies.director_id,
	directors.first_name
FROM movies
INNER JOIN directors 
ON movies.director_id = directors.director_id

SELECT
	mv.movie_id,
	mv.movie_name,
	mv.director_id,
	d.first_name
FROM movies mv
INNER JOIN directors d ON mv.director_id = d.director_id


--using tablename * or table_alias * instead of individual column name
SELECT
	mv.*,
	d.*
FROM movies mv 
INNER JOIN directors d
ON mv.director_id = d.director_id

--USING keyword

SELECT 
* 
FROM movies
INNER JOIN directors USING (director_id)

--connect movies and movies_revenues
SELECT 
*
FROM movies
INNER JOIN movies_revenues USING (movie_id)

--can we connect more than two tables -yes
SELECT * FROM movies
INNER  JOIN directors USING (director_id)
INNER JOIN movies_revenues USING  (movie_id)

--select movies name, director name and domestic revenues for all japanese movies

select 
	mv.movie_name,
	concat(d.first_name,' ',d.last_name) as director_name,
	r.revenues_domestic
from movies mv
inner join movies_revenues r using (movie_id)
inner join directors d using (director_id)
where movie_lang = 'Japanese';


--Select movie name,director name for all English,Chinese and Japanese movies where domestic revenue is greater than 100

SELECT 
	m.movie_name,
	CONCAT(d.first_name,' ',d.last_name) as director_name,
	r.revenues_domestic
FROM movies m
INNER JOIN directors d USING (director_id)
INNER JOIN movies_revenues r USING (movie_id)
WHERE
	m.movie_lang IN('English','Chinese','Japanese')
	AND
	r.revenues_domestic > 100
ORDER BY 3 DESC


--Select movie name,director name,movie language ,total revenue for all top 5 movies

SELECT 
	m.movie_name,
	CONCAT(d.first_name,' ',d.last_name) AS director_name,
	m.movie_lang,
	(r.revenues_domestic + r.revenues_international) AS Total_revenues
FROM movies m
INNER JOIN directors d USING (director_id)
INNER JOIN movies_revenues r USING (movie_id)
ORDER BY revenues_domestic NULLS LAST
LIMIT 5;



--What were the top 10 most profitable movies between year 2005 and 2008 
--print the movies name, director name, moviers language and total revenues

SELECT 
	m.movie_name,
	CONCAT(d.first_name,' ', d.last_name) AS director_name,
	m.movie_lang,
	(r.revenues_domestic + r.revenues_international) As total_revenues
FROM movies m
INNER JOIN directors d USING (director_id)
INNER JOIN movies_revenues r USING (movie_id)
WHERE 
	m.release_date BETWEEN '2005-01-01' AND '2008-12-31'
ORDER BY 4 DESC NULLS LAST
LIMIT 10;


--
CREATE TABLE t1(test INT);

CREATE TABLE t2(test VARCHAR(10));

SELECT 
*
FROM t1
INNER JOIN t2 ON t1.test = CAST(t2.test AS INT)

--test with sample data for join
INSERT INTO t1 (test) VALUES (1),(2)
INSERT INTO t2 (test) VALUES (1),(2)

SELECT * FROM t2;


--LEFT JOIN 
CREATE TABLE left_products(
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(50)
)

CREATE TABLE right_products(
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(50)
)

INSERT INTO left_products (product_id, product_name) VALUES
(1,'Computer'),
(2,'Laptop'),
(3,'Monitors'),
(4,'Mics');

INSERT INTO right_products (product_id, product_name) VALUES
(1,'Computer'),
(2,'Laptop'),
(3,'Monitors'),
(4,'Mics');


--left join
SELECT 
*
FROM left_products
LEFT JOIN right_products USING (product_id)


--list all the movies with directors name and movie name
SELECT 
	CONCAT(d.first_name, ' ', d.last_name) AS director_name,
	m.movie_name
FROM directors d
LEFT JOIN movies m USING (director_id)


--count total movies of all directors
SELECT 
	CONCAT(d.first_name, ' ', d.last_name) AS director_name,
	COUNT(*) AS "total_movies"
FROM directors d
LEFT JOIN movies m USING (director_id)
GROUP BY director_name
ORDER  BY  COUNT(*) DESC;

--get all the total_revenues done by each movie for each director
SELECT
	CONCAT(d.first_name, ' ', d.last_name) AS director_name,
	SUM(r.revenues_domestic + r.revenues_international) AS total_revenue
FROM directors d 
RIGHT JOIN movies m USING (director_id)
LEFT JOIN movies_revenues r USING (movie_id)
GROUP BY director_name
HAVING SUM (r.revenues_domestic + r.revenues_international) > 100
ORDER BY 2 DESC NULLS LAST

--FULL JOIN
SELECT 
*
FROM left_products
FULL JOIN right_products USING (product_id)

SELECT
	mv.movie_id,
	mv.movie_name,
	mv.director_id,
	d.first_name
FROM movies mv
FULL JOIN directors d ON mv.director_id = d.director_id

--can we connect more than two tables -yes
SELECT * FROM movies
FULL JOIN directors USING (director_id)
FULL JOIN movies_revenues USING  (movie_id)

--lets join movies, actor, director and revenues together
SELECT  
*
FROM actors
JOIN movies_actors USING (actor_id)
JOIN movies USING (movie_id)
JOIN directors USING (director_id)
JOIN movies_revenues USING (movie_id)

--let self join left_products table

SELECT
*
FROM left_products t1
INNER JOIN left_products t2 USING (product_id)

--le tthe query hierarchical data like all directions and movies
SELECT
	m1.movie_name,
	m2.director_id
FROM movies m1
INNER JOIN movies m2 USING (movie_id)
ORDER BY m1.director_id, m2.director_id


--CROSS JOIN 
SELECT 
*
FROM left_products
CROSS JOIN right_products

SELECT 
*
FROM actors
CROSS JOIN directors

--NATURAL JOIN
SELECT 
*
FROM left_products
NATURAL LEFT JOIN right_products


--NATURAL join movie and director table
SELECT 
*
FROM movies
NATURAL JOIN directors

SELECT * FROM movies

SELECT 
*
FROM movies
NATURAL RIGHT JOIN directors


