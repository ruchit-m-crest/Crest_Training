select * from movies


select * from movies
where movie_id = 1

select * from movies
where movie_id = '1'  --automatic type conversion

select * from movies
where movie_id = integer '1'  -- manual type conversion

--CAST

--1.string to integer conversion
SELECT 
	CAST('10' AS integer);

SELECT
	CAST('10n' AS integer);

select 
	CAST('01-MARCH-2023' AS date)
	
--- String to Date
SELECT 
	CAST ('10-01-2024' AS DATE)

SELECT 
	CAST ('10-MAY-2024' AS DATE)

--- String to Boolean
SELECT 
	CAST ('TRUE' AS BOOLEAN),
	CAST ('0' AS BOOLEAN),
	CAST ('t' AS BOOLEAN),
	CAST ('n' AS BOOLEAN)

--- String to DOUBLE PRECISION 
SELECT 
	CAST ('12.34322' AS DOUBLE PRECISION)

--- Other syntax

SELECT '20-08-2024 12:01:55.567'::TIMESTAMP

SELECT '20-08-2024 12:01:55.567'::TIMESTAMPTZ


--- String to Interval
SELECT '10 hours'::interval

SELECT '1 DAY'::interval

SELECT '2 weeks'::interval

--- Implicit to Explicit conversion


--- Factorial
SELECT FACTORIAL(5);                            -- Implicit
SELECT FACTORIAL(CAST(5 AS bigint)) AS result;  --Explicit

--- Round with numeric
SELECT ROUND(10,2) AS "Round",                   -- Implicit
SELECT ROUND(CAST(10 AS integer),2) AS "ROUND"   --Explicit

--- Cast with TEXT 
SELECT SUBSTR('abcdefg',2)                       -- Implicit
SELECT SUBSTR(CAST('abcdefg' AS TEXT),2)         --Explicit


CREATE TABLE rating(
	id serial,
	rating VARCHAR(1)
);

INSERT INTO rating(rating)
VALUES 	('A'),
		('B'),
		('C'),
		('D'),
		('E'),
		(1),
		(2),
		(3),
		(4),
		(5)

SELECT 
	rating,
CASE
	WHEN rating~E'^\\d$' THEN
	CAST (rating AS integer)
	ELSE 
		0
	END AS rating
FROM rating


SELECT * FROM rating