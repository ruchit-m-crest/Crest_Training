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


--primary key 
create table table_items (
	item_id INTEGER PRIMARY KEY,
	item_name VARCHAR (100) NOT NULL
);

INSERT INTO table_items(item_id, item_name) VALUES 
(2,'pen');

--remove primary key
ALTER TABLE table_items
DROP CONSTRAINT table_items_pkey;

--add primary key  to existing table
 ALTER TABLE table_items
ADD PRIMARY KEY (item_id);

--composite key 
CREATE TABLE t_grades(
	course_id VARCHAR(100) NOT NULL,
	student_id VARCHAR(100) NOT NULL,
	grade int NOT NULL,
	PRIMARY KEY (course_id, student_id)
);

SELECT * FROM t_grades;

INSERT INTO t_grades (course_id, student_id, grade) VALUES
('maths', 's2', 70),
('chemistry', 's1',70),
('physics', 's1', 80),
('maths', 's1', 60);

drop table t_grades;

--FORIGN KEY  CONSTRAINT
create table  t_products(
	products_id INT PRIMARY KEY,
	product_name VARCHAR(100) NOT NULL,
	supplier_id INT NOT NULL,
	FOREIGN KEY (supplier_id) REFERENCES t_suppliers (supplier_id)
);

create table t_suppliers(
	supplier_id INT PRIMARY KEY,
	supplier_name VARCHAR(100) NOT NULL
)

--INSERT DATA
INSERT INTO t_suppliers(supplier_id, supplier_name) VALUES
(100, 'supplier 100'),
(2, 'supplier 2');

select * from t_suppliers;

INSERT INTO t_products (products_id, product_name, supplier_id) VALUES 
(1, 'pen', 1),
(2, 'paper', 2);


select * from t_products;

INSERT INTO t_products (products_id, product_name, supplier_id) VALUES
(5,'COMPUTER', 100);

--try to delete daa from a child or forign table
DELETE FROM  t_products WHERE products_id = 5;
DELETE FROM t_suppliers WHERE supplier_id =100;

--lets try to update  a data on p[arent table
UPDATE t_products
SET supplier_id = 100
WHERE 
	products_id = 1

--DROP A CONSTRAINT
ALTER TABLE t_products
drop constraint t_products_supplier_id_fkey;

--add / update a foreign key
ALTER TABLE t_products
ADD CONSTRAINT t_products_supplier_id_fkey  FOREIGN KEY (supplier_id) REFERENCES t_suppliers (supplier_id);


--CHECK CONSTRAINT
CREATE TABLE staff(
	staff_id SERIAL PRIMARY KEY,
	first_name VARCHAR(15),
	last_name VARCHAR(15),
	birth_date DATE CHECK(birth_date > '2000-01-01'),
	joined_date DATE CHECK(joined_date > birth_date),
	salary numeric CHECK(salary > 0)
);

INSERT INTO staff (first_name, last_name, birth_date, joined_date, salary) VALUES 
('ADAM', 'KING', '2000-09-09', '2004-01-01',2000000);

SELECT * FROM staff;

CREATE TABLE prices(
	price_id SERIAL PRIMARY KEY,
	product_id INT NOT NULL,
	price NUMERIC NOT NULL,
	discount NUMERIC NOT NULL,
	valid_from DATE NOT NULL
);

ALTER TABLE prices
ADD CONSTRAINT price_check
CHECK(
	price > 0
	AND discount > 0
	AND price > discount
);

INSERT INTO prices (product_id, price, discount, valid_from) VALUES ('1', 100, 20, '2020-10-01');

SELECT * FROM prices;

--rename a constraint
ALTER TABLE prices
RENAME CONSTRAINT price_check TO discount_price_check

--drop a constraint
ALTER TABLE prices
DROP CONSTRAINT discount_price_check
