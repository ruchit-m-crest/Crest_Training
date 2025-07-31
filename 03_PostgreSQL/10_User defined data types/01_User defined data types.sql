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


INSERT INTO clients_name (email) VALUES ('abc@gmail.com')

select * from clients_name