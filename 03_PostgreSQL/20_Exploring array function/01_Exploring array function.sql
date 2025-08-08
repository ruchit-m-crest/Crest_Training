--1. Constructing arrays and ranges

select 
	int4range(1,6),
	numrange(1.4213,6.2986,'[]'),
	daterange('20100101','20201220','()'),
	tsrange(localtimestamp,localtimestamp + interval '8 days','(]');
 
select
	array[1,2,3] as "Int Arrays",
	array[2.12225::float] as "Floating numbers with putting explicit type",
	array[current_date,current_date + 5]
 
--2. Comparision Operators
 
select
	array[1,2,3,4] = array[1,2,3,4] as "Equality",
	array[1,2,3,4] = array[2,3,4] as "Equality",
	array[1,2,3,4] <> array[1,2,3,4] as "Not Equality to",
	array[1,2,3,4] < array[2,3,4,5] as "Less than",
	array[1,2,3,4] <= array[2,3,4,5] as "Less than and equal to",
	array[1,2,3,4] > array[2,3,4,5] as "Greater than",
	array[1,2,3,4] >= array[2,3,4,5] as "Greater than and equal to";
 
select
	array[1,2,3,4] @> array[2,3,4] as "Contains",
	array['a','b'] <@ array['a','b'] as "Contaned by",
	array[1,2,3,4] && array[2,3,4] as "Is overlap";

select
	int4range(1,4) @> int4range(2,3) as "Contains",
	daterange(current_date, current_date + 30) @> current_date + 15 as "Contains value",
	numrange(1.6, 5.2) && numrange(0, 4)

--3. with || concatination

select
	array[1,2,4] || array[3,5,6] as "Combine array",
	array_cat(array[1,2,3], array[4,5,6]) as "Combine array via array_cat";
 
--4. Add an item to array
 
select 4|| array[1,2,3] as "Adding an element";

select array_prepend(4,array[1,2,3]) as "Adding an element using prepend";
 
select array[1,2,3] || 4 as "Adding an element";

select array_append(array[1,2,3],4) as "Adding an element using appened";
 
--5. # af dimentions in array
 
select array_ndims(array[[1],[2]]) as "Dimentions";

select array_ndims(array[[1,2,3],[4,5,6]]);
 
--6. Return a text expression of array's dimentions
 
select array_dims(array[[1],[2]])
 
--7. Return a array length
 
select array_length(array[1,2,3,4,5,6],1);

select array_length(array[]::integer[],1);
 
--8. Return lower bound of array
 
select array_lower(array[1,2],1);

select array_lower(array[1,2,3,4,5,6],1);
 
--9. Return upper bound of array
 
select array_upper(array[1,2],1);

select array_upper(array[1,2,3,4,5,6],1);
 
--10. Return the cardinality of the array dimentions
 
select 
	cardinality(array[[1],[2],[3],[4]]),
	cardinality(array[[1],[2],[3],[4],[5]]);
 
--11. Array_position
 
select 
	array_position(array['Jan','Feb','March','April','May'],'Feb'),
	array_position(array[1,2,3,4,5,6],3);
 
--12. Array CAT

select array_cat(array[1,2,3], array[4]);
 
--13. Array Append

select array_prepend(4, array[1,2,3]);

--14. Array remove

select array_remove(array[1,2,3,4], 4);

--15. Array replace

select array_replace(array[1,2,3,4],2,16);

--16. Formatting and converting arrays

select string_to_array('1,2,3,4',',');

select string_to_array('1,2,3,4,ABC',',','ABC');

--17. Setting an empty value to null
 
select string_to_array('1,2,3,4,ABC',',','');
 
--18. Array to string
 
select array_to_string(array[1,2,3,4],'|');

select array_to_string(array[1,2,null,4],'|');

select array_to_string(array[1,2,null,4],'|','empty_data');
 
--19. Create sample table with array data
 
create table teachers(
	teacher_id serial primary key,
	name varchar(100),
	phones text []
);
 
create table teacher1(
	teacher_id serial primary key,
	name varchar(100),
	phone text array
);
 
--20. Insert data into table
 
insert into teachers(name,phones) values ('Adam',array['(111)-222-3333','(555)-666-7777']);

insert into teachers(name,phones) values 
('Linda','{"(111)-123-4567"}'),
('Jeff','{"(222)-555-9999","(444)-789-12345"}');

--21. Find all phones record
 
select name,phones from teachers;
 
--22. Access array element
 
select name,phones[1] from teachers;
 
--23. Use filter conditions
 
select *
from teachers
where phones[1] = '(111)-222-3333';
 
--24. Search any array for all rows
 
select *
from teachers
where '(111)-222-3333' = any(phones);
 
--25. Modify array content
 
update teachers
set phones[2] = '(800)-123-4567'
where teacher_id = 2;

select * 
from teachers
where teacher_id = 2;
 
select * from teachers;
 
--26. Create table with one dimension array
 
create table teacher1(
	teacher_id serial primary key,
	name varchar(100),
	phone text array[1]
);
 
--27. Add two records in one dimension array - No
 
insert into teacher1(name, phone) values ('Adam',array['(111)-222-3333','(555)-666-7777']);
 
--28. unnest(anyarray)
 
select teacher_id,name,unnest(phones) from teachers;
 
--29. Use order by for phone numbers
 
select teacher_id,name,unnest(phones) 
from teachers
order by 3;
 
--30. Create table with multi dimension array
 
create table students(
	student_id serial primary key,
	student_name varchar(100),
	student_grade integer[][]
);
 
insert into students(student_name,student_grade) values ('s1','{90,2020}');
 
select * from students;
 
insert into students(student_name,student_grade) values 
('s2','{80,2020}'),
('s3','{70,2019}'),
('s4','{60,2019}');
 
--31. Search in multi dimension
 
select student_grade[1] from students;

select student_grade[2] from students;
 
--32. --33. Search all students with grade year 2020
 
select * from students where student_grade @> '{2020}';
 
--33. Search all students with gread greater than 70
 
select * from students where student_grade[1] > 70 ;
