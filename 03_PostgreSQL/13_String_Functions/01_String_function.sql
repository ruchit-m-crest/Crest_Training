--UPPER, LOWER , INITCAP

SELECT UPPER('amazing postgreSQL')

SELECT 
	UPPER(first_name) as first_name,
	UPPER(last_name) as last_name
FROM directors;

SELECT LOWER ('AMAZING')

SELECT INITCAP('everything is connected');

SELECT INITCAP(
		CONCAT(first_name, ' ', last_name)
)AS full_name
FROM directors
ORDER BY 
	first_name;

--LEFT, RIGHT FUNCTIONS
SELECT LEFT('ABCD',2); --AB

SELECT LEFT('ABCD',-1); --ABC

--get initial of all the directors
SELECT
	LEFT(first_name,1) AS initial
FROM directors
ORDER BY 1;

--RIGHT
SELECT RIGHT('ABCD',2)

SELECT RIGHT('ABCD',-1)

--FIND all director with last name  ending with 'on'
SELECT last_name
FROM directors
WHERE RIGHT(last_name, 2) ='on';

--REVERSE
SELECT REVERSE('my name is john');

--SPLIT_PART
SELECT SPLIT_PART('1,2,3,4,5', ',', 2);

SELECT SPLIT_PART('one,two,three,four',',',3)

--ger the release yesr of all the movies
SELECT  
    movie_name,
    SPLIT_PART(release_date::TEXT, '-', 1) AS release_year
FROM movies;

SELECT * from movies

--TRIM, LTRIM, BTRIM ,RTRIM
select 
	TRIM (
			leading
			from '  ABCC      '
	),
	TRIM (
			trailing
			from '   abcc   '
	),
	TRIM (
		from '   ABC    '
	)

--remove leading ZERO from 
SELECT
	TRIM (
		LEADING '0'
		FROM 
			CAST (0000123456 AS TEXT)
	)

--LPAD AND RPAD FUNCTION
SELECT LPAD('DATABASE', 15, '*');
SELECT RPAD('DATABASE', 15, '*');


--chart of the INCOME
SELECT 
	mv.movie_name,
	r.revenues_domestic,
	LPAD('*',CAST(TRUNC(r.revenues_domestic / 10) AS INT), '*') chart
FROM movies mv
INNER JOIN movies_revenues r ON r.movie_id = mv.movie_id
ORDER BY 3 DESC
NULLS LAST;

--LENGTH function
SELECT LENGTH('AMAZING POSTGRESQL')

SELECT LENGTH (CAST(12344600 AS text));

SELECT CHAR_LENGTH('');
SELECT CHAR_LENGTH(' ');

--get the total length of all the directors
SELECT
	first_name || ' ' || last_name AS full_name,
	LENGTH(first_name || ' ' || last_name) AS full_name_length
FROM directors
ORDER BY
	2 DESC

--position function
select position('rain' IN 'amazon rain forest');


--STRPOS function
SELECT strpos('world bank', 'bank');

SELECT 
	first_name,
	last_name
FROM directors
WHERE strpos(last_name, 'on') > 0;

--substring
SELECT substring('what a wonderfull world' from 1 for 4);

SELECT substring('what a wonderfull world' for 4);

--repeat function

SELECT REPEAT('A',4);

SELECT repeat(' ',10);

--Replace function
SELECT replace ('what a wonderfull world',' a wonderfull', ' an amazing');