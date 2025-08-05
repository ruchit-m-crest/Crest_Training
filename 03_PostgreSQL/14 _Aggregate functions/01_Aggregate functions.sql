--COUNT function
SELECT COUNT(*) FROM movies;

select * from movies;

--count all the records of a specific column
select count (movie_length) FROM movies;

select count(DISTINCT(movie_lang)) from movies;

--look  at all movies  revenues records
SELECT * FROM movies_revenues;

--get total domestic revenues for all movies
SELECT
	SUM(revenues_domestic)
FROM movies_revenues

--find the total movie length of all english language movies
SELECT * FROM movies;

SELECT 
	movie_length
FROM movies
where movie_lang = 'English'

--can i sum all the movies
select 
	sum(movie_length)
from movies;

--MIN & MAX function
SELECT max(movie_length) 
from movies;

select min(movie_length)
from movies;

--latest released english movie
SELECT 
	MAX(release_date)
FROM movies
WHERE movie_lang = 'English';

--first movies releas in chinese
SELECT 
min(release_date)
FROM movies
WHERE movie_lang = 'Chinese'

--greatest and least function
SELECT GREATEST(200,230,225);

SELECT LEAST ('a', 'b', 'c');

--AVG function
SELECT	
	AVG(movie_length)
FROM movies;

--combing the mathemetical function
SELECT 2+5 As addition

SELECT 100/5 As division;