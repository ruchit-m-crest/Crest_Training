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

--Ge