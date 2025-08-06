--using group by 
SELECT 
	movie_lang,
	COUNT (movie_lang)
FROM movies
GROUP BY movie_lang;

--get avg movies_length and group by movie language

SELECT
	movie_lang,
	AVG(movie_length)
FROM movies
GROUP BY movie_lang
ORDER BY movie_lang

--get the sum of total movie length per age certificate
SELECT
	age_certificate,
	SUM(movie_length)
FROM movies
GROUP BY age_certificate

--list minimum and maximum movie length group by movie language
SELECT 
	movie_lang,
	MIN(movie_length),
	MAX(movie_length)
FROM movies
GROUP BY movie_lang


-- HAVING FUNCTION

--list language where their total movie length  is greater than 200

SELECT
	movie_lang,
	SUM(movie_length)
FROM movies
GROUP BY movie_lang
HAVING SUM(movie_length) > 200
ORDER BY SUM(movie_length);

--list all directors where their sum of total movie length is greater then 200
SELECT
	director_id,
	SUM(movie_length)
FROM movies
GROUP BY director_id
HAVING SUM(movie_length) > 200
ORDER BY director_id;

CREATE TABLE employee_test(
	employee_id SERIAL PRIMARY KEY,
	employee_name VARCHAR(100),
	department VARCHAR(100),
	salary INT
);


SELECT * FROM employee_test


INSERT INTO employee_test (employee_name, department, salary) VALUES
('John','Finance',22500),
('Mary',NULL, 34000),
('adam', NULL, 1200),
('Megan', 'IT', 50000);

--Display all departmentt
SELECT
	employee_name,
	department,
	salary
FROM employee_test
ORDER BY 
	department

--count no. of emploee in each dapratment
SELECT 
	department,
	COUNT(employee_name) AS total_employees
FROM employee_test
GROUP BY 
	department

--