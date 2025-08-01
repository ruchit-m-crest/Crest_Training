--addr domain with varchar(100)
create domain addr VARCHAR(100) NOT NULL

CREATE TABLE locations(
	address addr
)

INSERT INTO locations (address) VALUES ('123 abc')

--positive numeric domain with a positive  numeric i.e. >0

create domain positive_numeric INT NOT NULL CHECK (VALUE > 0)

CREATE TABLE sample(
	sample_id SERIAL PRIMARY KEY,
	value_num positive_numeric
)

INSERT INTO sample (value_num) VALUES (10)

select * from sample;

--us_postal_code domain to check for valid postal code
CREATE DOMAIN us_postal_domain AS text
CHECK(
	VALUE ~'\d{5}$'
	OR VALUE ~'^\D{5}-\d{4}$'
)

CREATE  TABLE addresses(
	address_id SERIAL PRIMARY KEY,
	postal_code us_postal_domain
)

INSERT INTO addresses (postal_code) Values ('10000')

select * from addresses;


--Domain to check for an email validation
CREATE DOMAIN proper_email VARCHAR(150)
CHECK (
    VALUE ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'    --- * -> for case insensitive inputs
);

CREATE TABLE clients_name(
	client_id SERIAL PRIMARY KEY,
	email proper_email
)

INSERT INTO clients_name (email) VALUES ('abc@gmail.com')

select * from clients_name


--crete an enumeration type domain

CREATE DOMAIN valid_colour VARCHAR(10)
CHECK (VALUE IN ('red', 'green','blue'))


CREATE TABLE colours(
	colour  valid_colour
)

INSERT INTO  colours (colour) VALUES ('red')

SELECT * FROM colours;



--Get all domain list in a schema
select  typname
FROM pg_catalog.pg_type
JOIN pg_catalog.pg_namespace
ON pg_namespace.oid = pg_type.typnamespace
WHERE
typtype = 'd' and nspname = 'public';

--DROP A DOMAIN
DROP DOMAIN positive_numeric CASCADE

select * from sample


--COMPOSITE data type

--create a address composite data type
CREATE TYPE address AS (
	city VARCHAR(50),
	country VARCHAR(20)
)

CREATE TABLE companies(
	comp_id SERIAL PRIMARY KEY,
	address address
)

INSERT INTO companies (address) VALUES (ROW('New york', 'US'))

SELECT * FROM companies;

select (address).country FROM companies;


--create a composite 'inventry_item' data type  
Create TYPE inventry_type as(
	product_name VARCHAR(200),
	supplier_id INT,
	price numeric
)

create table inventory(
	inventory_id SERIAL PRIMARY KEY,
	item inventry_type
)

INSERT INTO inventory (item) VALUES (ROW('pencil',12, 5.99))
SELECT * FROM inventory;

SELECT (item).product_name FROM inventory WHERE (item).price > 5.00;


--Create currency  ENUM data type with currency data
CREATE TYPE currency AS ENUM ('INR','EUR','USD')

SELECT 'INR'::currency

ALTER TYPE currency ADD VALUE 'GBP' AFTER 'INR'

CREATE TABLE stock (
	stock_id SERIAL PRIMARY KEY,
	stock_currency currency
)

INSERT INTO stock (stock_currency) VALUES ('INR')

SELECT * FROM stock

--DROP type name
CREATE TYPE demo AS ENUM ('ABC','123')

DROP TYPE demo

-- Alter data types
CREATE TYPE myaddress AS (
	city VARCHAR(50),
	country VARCHAR(20)
)

--rename a dat atype
ALTER TYPE myaddress RENAME TO my_address

--change the owner
ALTER TYPE my_address OWNER TO  postgres

--change the schema 
ALTER TYPE my_addresss SET SCHEMA test_scm

--add a new attributes
ALTER TYPE my_address ADD ATTRIBUTE street_address VARCHAR(150)

---Create type as enum
CREATE TYPE mycolors AS ENUM ('green','red','blue')

--list all values
SELECT enum_range(NULL::mycolors)

--update a value
ALTER TYPE mycolors RENAME VALUE 'red' TO 'orange'

--add a new value
ALTER TYPE mycolors ADD VALUE 'red' BEFORE 'orange'

--update enum data in a production server 
CREATE TYPE status_enum As ENUM	('queued','waiting','running','done')


CREATE TABLE jobs(
	job_id SERIAL PRIMARY KEY,
	job_status status_enum
)

insert into jobs (job_status) VALUES ('done')

SELECT * FROM jobs;


UPDATE jobs SET job_status = 'running' WHERE job_status = 'waiting

