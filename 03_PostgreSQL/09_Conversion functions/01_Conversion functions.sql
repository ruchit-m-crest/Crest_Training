--Convert integer to  string
select 
	To_CHAR(100870,'99,9999');

--view the release date of movies
select 
	release_date,
	TO_CHAR(release_date,'DD-MM-YYYY'),
	TO_CHAR(release_date,'Dy, MM, YYYY')
from movies;

--converting timestamp into string
SELECT 
	to_char(
		TIMESTAMP '2020-01-01 14:21:21',
		'HH12:MI:SS'
	);

--addding currenvy symbol to revenues
SELECT
	movie_id,
	revenue_domastic,
	TO_CHAR(revenue_domastic, ' $999999D9999')
FROM movies_revenues

--Convert string to int
select 
	To_number('1008.70','9999.');
	SELECT TO_DATE('20/08/2004','DD/MM/YYYY') 

SELECT 
	TO_DATE('062014','ddyyyy')

SELECT 
	TO_DATE('May 2004' , 'Month yyyy')

SELECT 
	TO_DATE('27/02/2021' , 'DD/MM/YYYY')  -- Error handling for date that not exist 

--- TO_NUMBER

SELECT 
	TO_NUMBER ('22,22.222' , '99G99D999')
---- G for groups , D for decimals and S for symbols

SELECT 
	TO_NUMBER ('22,22-222' , '99G99S999')

--- TO_TIMESTAMP
SELECT 
	TO_TIMESTAMP ('22-12-2004 2:00:00','dd-mm-yyyy hh:mi:ss')

SELECT 
	TO_TIMESTAMP ('May 2004','MON YYYY')