create table persons(
	person_id SERIAL  PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL
 );

 ALTER TABLE persons
 add column age INT NOT NULL

 ALTER TABLE persons
 add column nationality VARCHAR(20) NOT NULL

 ALTER TABLE persons
 ADD COLUMN email VARCHAR(20) UNIQUE


 select * from persons

 --rename a table
 alter table persons
 rename to users

 alter table users
 rename to persons

 --rename a column
 alter table persons
 rename column age to person_age

 --drop a column
 alter table persons
 drop column person_age

 --add column
 alter table persons
 add column age VARCHAR(20)

 --change data type of column
 alter table persons
 alter column age type int
 USING age::integer

 alter table persons
 alter column age type VARCHAR(20)

 --set a default value of column
 alter table persons
 add column is_enable VARCHAR(1)

 ALTER TABLE persons
 alter column is_enable SET DEFAULT 'Y'

 INSERT INTO persons (first_name, last_name, nationality, age) 
 VALUES('JOHN', 'DOE', 'USA', 30)

 select * from persons

 --add a unique constrants to the column
 create table web_links(
	web_links SERIAL PRIMARY KEY ,
	link_url VARCHAR(255) NOT NULL,
	link_target  VARCHAR(20)
 );

 select * from web_links

 INSERT INTO web_links (link_url, link_target) VALUES ('https//:www.amazon.com', '_blank')


 ALTER TABLE web_links
 add constraint unique_web_url	UNIQUE (link_url);

 alter table web_links
 add column is_enable VARCHAR(2

 INSERT INTO web_links(link_url, link_target, is_enable) VALUES ('https//:www.netflix.com', '_blank','Y')