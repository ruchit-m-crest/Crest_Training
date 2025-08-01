--NOT NULL CONSTRAINTS

CREATE TABLE  table_nn(
	id SERIAL PRIMARY KEY ,
	tag text NOT NULL
);

INSERT INTO table_nn (tag) VALUES ('crest')

SELECT * FROM table_nn;


--UNIQUE CONSTRAINT
CREATE TABLE table_emails(
	id  SERIAL PRIMARY KEY,
	email text UNIQUE
)

INSERT INTO table_emails (email) VALUES ('xyz@gmail.com')

SELECT * FROM table_emails


--DEFAULT CONSTRAINT
CREATE TABLE employees(
	employees_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	is_enable VARCHAR DEFAULT 'Y'
)

select * from employees

INSERT INTO employees (first_name, last_name) VALUES ('abc', 'xyz')

ALTER TABLE employees
ALTER COLUMN is_enable SET DEFAULT 'N'

ALTER TABLE employees
Alter COLUMN is_enable DROP DEFAULT