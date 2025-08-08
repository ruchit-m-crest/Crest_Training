--UNION 
SELECT 
	product_id, product_name
FROM left_products
UNION
SELECT 
	product_id, product_name
FROM right_products		


SELECT 
	first_name,
	last_name
FROM directors
UNION
SELECT
	first_name,
	last_name
FROM actors
ORDER BY first_name ASC

--lets combine all the directors where nationality is american Chinese and Japanese with all actors
SELECT
	first_name,
	last_name,
	'director' AS "tablename"
FROM directors
WHERE 
	nationality IN ('American', 'Chinese', 'Japanese')
UNION
SELECT
	first_name,
	last_name,
	'actor' AS "tablenae"
FROM actors
WHERE
	gender = 'F'
ORDER BY first_name


--select first name and last name of the all directors and actors which born after 1970

SELECT
	first_name,
	last_name,
	date_of_birth,
	'directors' AS "tablename"
FROM directors
WHERE 	
	date_of_birth > '1970-12-31'
UNION
SELECT
	first_name,
	last_name,
	date_of_birth,
	'actors' As "tablename"
FROM actors
WHERE 
	date_of_birth > '1970-12-31' 
ORDER BY date_of_birth ASC

--select all directora and actors name whose name start with 'A'
`SELECT
	first_name,
	last_name,
	'actors' AS "tablename"
FROM actors
WHERE 
	first_name LIKE 'A%'
UNION
SELECT 
	first_name,
	last_name,
	'directors' AS "tablname"
FROM directors
WHERE 
	first_name LIKE 'A%'
ORDER BY first_name;


--can we combine different number of column from each queries
SELECT
	first_name,
	last_name,
	date_of_birth,
	'directors' As "tablename"
FROM directors
WHERE 
	nationality IN ('American', 'Chinese', 'Japanese')
UNION
SELECT
	first_name,
	last_name,
	date_of_birth,
	'actors' As "tablename"
FROM actors
WHERE
	gender = 'F'


CREATE TABLE table2(
	col3 INT
)


SELECT col1, col2 FROM table1
UNION
SELECT NULL AS col1,col3 FROM table2

--INTERSECT

--lets use INTERSECT on left_products and right_products tables
SELECT
	product_id,
	product_name
FROM left_products
INTERSECT
SELECT
	product_id,
	product_name
FROM right_products

--lets intersect first name last name of directors and actors table
SELECT 
	first_name,
	last_name
FROM directors
--ORDER BY first_name
INTERSECT
SELECT
	first_name,
	last_name
FROM actors
--ORDER BY first_name

--list all the directors first and last name unless they have same first name in femal actors
SELECT 
	first_name,
	last_name
FROM directors
EXCEPT
SELECT
	first_name,
	last_name
FROM actors
WHERE
	gender = 'F'