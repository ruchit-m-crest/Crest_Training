-- get all the records from the movies table 
select
* 
from movies;

-- get all the records from the actors table
select
* 
from actors;

--select specific column from the table
SELECT
first_name 
from actors

--select first name and last name from the actor table
SELECT
first_name, last_name 
from actors

--get movie name and lkanguage from the table
SELECT
movie_name, movie_lang 
from movies;

--aliases to the columns 
Select
first_name  
as "First Name" 
from actors;

--multiple aliases at same time 
select movie_name as "Movie",
movie_lang as "Language"
from movies;

--AS as a optional
select movie_name "Movie",
movie_lang "Language"
from movies;

--select statement
select
first_name 
from actors;

--combine 2 or more in one single column
select
first_name || last_name 
from actors;

select 
first_name || ' ' || last_name 
as "Full Name"
from actors;

select 
10*2 
as multiply6


select 
first_name || ' ' || last_name 
from actors;

--sort all the movies in ascending order by release date
SELECT
* 
from movies 
order by 
release_date ASC;

--sort all the movies in descending order by release date
select 
*
from movies
order by 
release_date DESC;

--sort based on multiple column
select
* from movies
order by 
	release_date DESC,
	movie_name ASC;

--get first and last name form actor
select
first_name, last_name
from actors;

--make aliases for last_name as surname
select 
	first_name,
	last_name as surname
from actors;

--sort rows by last_names	
select 
	first_name,
	last_name as surname
from actors
order by last_name;

--sort rows by last_name  DESC
select 
	first_name,
	last_name as surname
from actors
order by last_name DESC;

--use aliases surname inorder by clause
select 
	first_name,
	last_name as surname
from actors
order by surname DESC;

--sort all rows by first_name in ASC and date_of_birth DESC
select 
*
from actors
order by
	first_name ASC,
	date_of_birth DESC

-- ASC and DESC according to the column index
select 
	first_name,
	last_name,
	date_of_birth
from actors
order by
	1 ASC,
	3 DESC

--get all unique records in movies table
select
DISTINCT * 
from movies
order by movie_id ASC;
