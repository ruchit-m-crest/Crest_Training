--1.Datestyle
 
show datestyle;
 
--2. String to YYYY-MM-DD format from ISO Format
 
select to_date('2020-01-01','YYYY-MM-DD');
select to_date('20200101','YYYYMMDD');
select to_date('December 1,2020','Month DD,YYYY');
select to_date('Dec 1,2020','Mon DD,YYYY');
select to_date('1 january, 2020','dd Month, yyyy');
select to_date('8th December, 2020','ddth Month, yyyy');