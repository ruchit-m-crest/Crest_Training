CREATE TABLE books(
	book_id SERIAL PRIMARY KEY,
	book_info JSONB
);

INSERT INTO books (book_info) VALUES
('
{
 	"title":"Book title1",
	 "author":"author1"
}')


INSERT INTO books (book_info) VALUES
('{
 	"title":"Book title2",
	 "author":"author2"
}'),
('{
	 "title":"Book title3",
	 "author":"author3"
}'),
('{
	 "title":"Book title4",
	 "author":"author4"
}')


SELECT * FROM books;

SELECT book_info FROM books;

SELECT book_info->'title' FROM books;

	
SELECT 
	book_info->>'title' as  Title,
	book_info->>'author' AS  Author
FROM books;

SELECT * FROM books;

INSERT  INTO books (book_info) VALUES
('{"title": "Book Title 10", "author": "Author 10"}');

--update data
UPDATE books
SET book_info = book_info || '{"author":"Adam"}'

--lets output directors table into JSON format

SELECT * FROM directors;
WHERE book_info->>'author'='Author 10';


UPDATE books
SET book_info= book_info || '{"title":"The Future 1.0"}'
WHERE book_info->>'author' = 'Adam'
RETURNING *  --ONLY PRINT AFFECTED ROWS

--Add additional field  like 'best seller' as boolean field
UPDATE books
SET book_info = book_info || '{"Best-seller": true}'
WHERE book_info->>'author' = 'Adam'
RETURNING *

--Lets add multiple key-value 
UPDATE books
SET book_info = book_info || '
{
	"category" : "Science",
	"pages" : 255
}'
WHERE book_info->>'author' = 'Adam'

SELECT * FROM books;

--Delete best seller key value
UPDATE books 
SET book_info = book_info - 'Best-seller'
WHERE book_info->>'author' = 'Adam'

SELECT * FROM books;

--Add a nested array data in JSON
UPDATE books
SET book_info = book_info || '{"availability_locations" : [
	"Delhi",
	"Surat",
	"Ahmedabad"
]}'
WHERE book_info->>'author'='Adam'


--Delect from array
UPDATE books
SET book_info = book_info #-'{availability_locations,1}'
WHERE book_info->>'author'='Adam'
RETURNING *

--lets output directors table into JSON format

SELECT * FROM directors;

SELECT row_to_json(directors) FROM directors;


--Select only  one director_id from table
SELECT row_to_json(t)
FROM (
    SELECT
        director_id,
        first_name,
        last_name,
        nationality
    FROM directors
) AS t;

--LIST movies for each director
SELECT 
*,
(
	SELECT json_agg(x) AS all_movies FROM 
	(
		SELECT 
			movie_name
		FROM movies
		WHERE director_id = directors.director_id
	) AS x
)
FROM directors


--Select director_id, first_name, last_name and all movies 
SELECT 
	director_id,
	first_name,
	last_name,
(
	SELECT json_agg(x) AS movies FROM
	(
		SELECT
			movie_name
		FROM movies
		WHERE director_id = directors.director_id
	) As x
)
FROM directors


--Buils a JSON array
SELECT json_build_array(1,2,3,4,5);

--string with number
SELECT json_build_array(1,2,'Hello',4,'Hi');


SELECT json_build_object(1,2,3,4,5,'Hi');

--can we supply key/value style data? --yes
SELECT json_object('{name, email}','{"Adam","a@b.com"}');

--CREATE TABLE
CREATE TABLE directors_docs(
	id SERIAL PRIMARY KEY,
	body JSONB
);

--INSERT DATA
INSERT INTO directors_docs (body)
SELECT row_to_json(a) :: jsonb FROM
(
SELECT
	director_id,
	first_name,
	last_name,
	date_of_birth,
	nationality,
	(
		SELECT json_agg(x) As movies FROM
		(
			SELECT
				movie_name
			FROM movies
			WHERE director_id = directors.director_id
		) AS x
	)
FROM directors
) AS a

SELECT * FROM directors_docs;

--Find all first name equal to john
SELECT 
*
FROM directors_docs
WHERE body->'first_name' ? 'John'

--find all the records with director_id_1
SELECT 
*
FROM directors_docs
WHERE body->'director_id' ? '1'

-- Find all records with director_id=1
 
select *

from directors_docs

where body @> '{"director_id":1}';
 
-- Find the record for movie name toy story
 
select *

from directors_docs

where body -> 'all_movies' @> '[{"movie_name":"Toy Story"}]';
 
-- Find all records first name starting with 'J'
 
select *

from directors_docs

where body ->> 'first_name' like 'J%';
 
-- Find all records where director_id > 2
 
select *

from directors_docs

where (body ->> 'director_id'):: integer > 2;
 
-- Find all records where director_id is in 1,2,3,4,5 and 10.
 
select *

from directors_docs

where (body ->> 'director_id'):: integer in (1,2,3,4,5,10);
 
-- Load data from contacts_docs
 
select * from contacts_docs;
 
-- Find all first name equal to 'John'

select *

from contacts_docs

where body->'first_name' ? 'John';
 
-- Execution time to run this query
 
explain analyze select *

from contacts_docs

where body->'first_name' ? 'John';
 
-- Create gin index
 
create index idx_gin_contacts_docs_body on contacts_docs using gin(body);

select pg_size_pretty(pg_relation_size('idx_gin_contacts_docs_body'::regclass)) as index_name;
 
create index idx_gin_contacts_docs_body_cool on contacts_docs using gin(body jsonb_path_ops);

select pg_size_pretty(pg_relation_size('idx_gin_contacts_docs_body_cool'::regclass)) as index_name;
 
