INSERT INTO customers (first_name)
VALUES 
('Bill''O Sullivan');

SELECT * FROM customers;


 -- use returning to return all rows
 INSERT INTO customers (first_name)
 values ('ruchit') returning *

  INSERT INTO customers (first_name)
 values ('Jeel') returning customers_id

 --Update data in a table
 SELECT * FROM customers;

 update customers
 set email = 'jeel@gmail.com'
 where customers_id = 4

--update multiple column
update customers
set email = 'abc@gmail.com',age =22
where customers_id = 2

--use returning to get updated rows
update customers
set email = 'abc@gmail.com',age =22
where customers_id = 2 
returning *

--updating all records in table with no where clause
select * from customers;

update customers
set is_enable = 'y'
where customers_id = 1

--delete records
delete from customers 
where customers_id = 3