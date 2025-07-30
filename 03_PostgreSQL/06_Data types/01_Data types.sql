create table table_boolean(
	product_id SERIAL PRIMARY KEY,
	is_available BOOLEAN NOT NULL
);

--insert into table
INSERT INTO table_boolean(is_available) VALUES ('Y'),('1');

SELECT * FROM table_boolean

select
*
from table_boolean
where is_available = '1'

--using not for condition
select 
*
from table_boolean
where is_available

--create table
create table table_serial(
	product_id SERIAL ,
	product_name VARCHAR(100)
);

--insert data
INSERT INTO table_serial(product_name) VALUES
('pen');

select * from table_serial;

INSERT INTO table_serial(product_name) VALUES
('pencil2');


create table table_number(
col_numeric numeric(20,5),
col_real real,
col_double double precision
)
select * from table_number

INSERT INTO table_number (col_numeric, col_real, col_double) VALUES 
(.9, .9, .9),
(1.12345,1.12345,1.12345),
(1.123456789,1.123456789,1.123456789);

--date and time
create table table_time(
	id serial primary key,
	class_name varchar(100) NOT NULL,
	start_time time NOT NULL,
	end_time time NOT NULL
);

--insert data
INSERT  INTO table_time(class_name, start_time, end_time)
VALUES
('Maths','08:00:00','09:00:00'),
('Chemistry','9:01:00','10:00:00')

select * from table_time

--getting current  time
select current_time;

--getting current time with  precision
select current_time(2);

--use local time
select localtime, localtime(2)

--arithmatic calculations
4:00
10:00

select  time '12:00' - time '4:00' as result;


--creat table
create table table_time_tz(
	ts TIMESTAMP,
	tstz TIMESTAMPTZ
);

--set timezone
INSERT INTO table_time_tz (ts, tstz) VALUES
('2020-02-22 10:10:10-07','2020-02-22 10:10:10-07')

select * from table_time_tz

--show timezone
SHOW TIMEZONE

select TIMEOFDAY();


--UUID

create extension if not exists "uuid-ossp";

select uuid_generate_v1();
"29ee6092-6d3b-11f0-8e2a-97c1ee7a7a38"

select uuid_generate_v4();
"43c09e6d-0bdd-4cc2-90aa-1f49fe23f767"

create table table_uuid(
	product_id  UUID DEFAULT uuid_generate_v1(),
	product_name VARCHAR(100) NOT NULL  
);

select * from table_uuid;

INSERT INTO table_uuid (product_name) VALUES ('ABC111');
select * from table_uuid


ALTER TABLE table_uuid
ALTER COLUMN product_id
SET DEFAULT uuid_generate_v4()

CREATE TABLE mobile_register(
	mb_id SERIAL,
	mobile text[]
);

INSERT INTO mobile_register (mobile)
VALUES ('{12345-67890,12345-67890,12345-67890}'),
       ('{12345-67890,12345-67890,12345-67890}')

SELECT * FROM mobile_register

SELECT mobile[1] FROM mobile_register

--- hstore

CREATE EXTENSION IF NOT EXISTS "hstore";

CREATE TABLE library1(
	book_id SERIAL,
	book_info hstore
);

INSERT INTO library1 (book_info)
VALUES ('
			"book_name" => "xyz",
			"author_name" => "zxy",
			"price" => "100"
'),('
			"book_name" => "abc",
			"author_name" => "cba",
			"price" => "200"
');

SELECT * FROM library1

SELECT book_info->'book_name' FROM library1

--- JSON
--- we have normal JSON and JSONB for binary data
--- JSON supports white spaces and identation but not JSONB
--- JSONB supports fast searching and indexing 

CREATE TABLE json(
	id serial primary key,
	docs JSON
);

INSERT INTO json(docs)
VALUES 
	('[1,2,3,4,5]'),
	('[2,3,4,5,6]'),
	('{"Key" : "Value"}')

SELECT * FROM json

SELECT * FROM json
WHERE docs @> '2'    --- not working cause we have data type JSON its working in JSONB

ALTER TABLE json
ALTER COLUMN docs TYPE JSONB;

SELECT * FROM json
WHERE docs @> '{"Key":"Vlaue"}'   

CREATE INDEX ON json USING GIN (docs jsonb_path_ops );

--- NETWORK ADRESSES
--- cidr -> ipv4 and ipv6 networks
--- inet -> ipv4 and ipv6 with host 
--- macaddr  -> mac adresses
--- macaddr8  -> mac adresses EUI-64 format 


CREATE TABLE ip(
	id SERIAL,
	ip INET
);

INSERT INTO	 ip(ip)
VALUES ('4.234.22.245'),
		('192.34.5.6')

SELECT * FROM ip

SELECT ip, set_masklen(ip,24)  AS "Masked" FROM ip  

SELECT ip, set_masklen(ip,24) AS "Masked", 
			set_masklen(ip::cidr,24) AS "CIDR" ,
			ip::cidr   --- By default masked bits 32
FROM ip