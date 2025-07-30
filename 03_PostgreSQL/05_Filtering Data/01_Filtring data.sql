--where clause
select * from movies

select 
*
from movies
where 
	movie_lang = 'English'

-- get all japanese language movies
select 
*
from movies
where 
	movie_lang = 'Japanese'
	
--get movies with english language and agge certificate is 18
select 
* 
from movies
where 
	movie_lang = 'English'
	AND
	age_certificate = '18'


--Get all english or japanese movies
select 
*
from movies
where 
	movie_lang = 'Japanese'
	OR
	movie_lang = 'English'


--get all english movie and director id is equal to 10
select 
*
from movies
where 
	movie_lang = 'English'
	AND
	director_id = '10'

--Combining OR + AND operator
--Get all english or japanese movies
select 
*
from movies
where 
	movie_lang = 'Japanese'
	OR
	movie_lang = 'English'
	AND
	age_certificate = '12'
	order by
	movie_lang;

--Combing AND with OR
select 
*
from movies
where 
	movie_lang = 'English'
	AND
	age_certificate = '12'
	OR
	movie_lang = 'Japanese'
	order by
	movie_lang;

--LOGICAL OPERATOR

--get all movie has length over 100
select
* 
from movies
where 
movie_length > 100
order by 
movie_length DESC;

-- get all movies that release after 2000
select
* 
from movies
where
	release_date > '2002-12-31'


--using <
select 
*
from movies
where 
	movie_lang < 'English'

-- Top 5 longest movies
select 
*
from movies
order by movie_length DESC
LIMIT 5

--Top 5 oldest american directors
select
*
from directors
where 
	nationality = 'American'
order by date_of_birth DESC
LIMIT 5


--top 10 oldest female actress
select 
*
from actors
where 
	gender = 'F'
order by 
	date_of_birth DESC
LIMIT  10

--List 5 longest movies after top 5 longest movies
select 
*
from movies
order by movie_length DESC
LIMIT 5 OFFSET 5

-- list 5 movies after the top 5 movies in movies_id order wise(from id-6 to id-10)
select 
*
from movies
order by movie_id
LIMIT 5 OFFSET 5

--FETCH first 5 rows from the movies length
select 
*
from  movies
fetch first 5 rows only

-- get first 5 movies from the fifth record by length
select
*
from movies
order by movie_length  DESC
FETCH FIRST 5  ROWS ONLY
OFFSET 5

-- GET all English, japanese movies
SELECT 
*
FROM movies
WHERE 
	movie_lang IN ('English', 'Japanese')
ORDER BY movie_lang


SELECT 
*
FROM movies
WHERE 
	age_certificate IN ('12', 'PG')

-- Get all movies where director are not 12 and 10
SELECT
*
FROM directors
where director_id NOT IN (10, 13)
order by 
	director_id 

--get all actora where id is not 1,2,3,4
SELECT
*
FROM actors
where actor_id NOT IN (1,2,3,4)
order by 
	actor_id 

--get all the actors whose birth are between 1991 and 1995
select 
*
from actors
where date_of_birth BETWEEN '1991-01-01' AND '1995-01-01'

--LIKE and ILIKE

--get all the actors whose name start with 'A'
select
*
from actors
where first_name like 'A%'
order by first_name;

--get all the actro whose last_name ending with 'a'
select
*
from actors
where 
	last_name LIKE '%a'
	order by  first_name

--get actyor whose first name is 3 character long
select
*
from actors
where
	first_name LIKE '___'


--NULL and NOT NULL

--get list of actor whose birth dates are missing
select
*
from actors
where
	date_of_birth IS NULL

--get list of actor whose birth dates are missing or first name is missing
select
*
from actors
where
	date_of_birth IS NULL
	or 
	first_name IS NULL

--get list of movies whose domastic income is null
select 
*
from movies_revenues
where
	revenue_domastic IS NULL

--combine first and last name  of actor in a singlle rows
select 
	CONCAT (first_name, ' ', last_name) as "Actor name"
from actors


--Concatination techniques

--using ||
select 'Hello' || '' || 'world' ;

--using CONCAT
select 
	CONCAT (first_name, ' ', last_name) as "Actor name"
from actors

--using CONCAT_WS
select 
	CONCAT_WS (' | ', first_name, last_name) as "Actor name"
from actors
