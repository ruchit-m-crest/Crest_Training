--create sequence
CREATE SEQUENCE IF NOT EXISTS test_seq;

--nextval
SELECT nextval('test_seq');

--current value
SELECT currval('test_seq');

--set value
SELECT setval('test_seq', 100);

--set value skip over
SELECT setval('test_seq', 200, false)  --means nextval gives 200 as output at first time and then it wil increment the value

CREATE SEQUENCE IF NOT EXISTS test_seq2 start with 100;

--alter a sequence
SELECT nextval('test_seq')


ALTER SEQUENCE test_seq RESTART WITH 100;

--create sequence with start, increment, etc...
CREATE SEQUENCE IF NOT EXISTS test_seq3
INCREMENT 50
MINVALUE 200
MAXVALUE 5000
START WITH 500

SELECT nextval('test_seq3');

CREATE SEQUENCE test_seq4 AS SMALLINT;
SELECT nextval('test_seq4')


--Creating a descending sequence
CREATE SEQUENCE seq_des1
INCREMENT -1
MINVALUE 1
MAXVALUE 5
START 5
NO CYCLE;

SELECT nextval('seq_des1')

DROP SEQUENCE seq_des1;

--Attach a sequence with table column
CREATE TABLE users(
	user_id SERIAL PRIMARY KEY,
	user_name VARCHAR(50)
)

INSERT INTO users (user_name) VALUES  ('abc1');

SELECT * FROM users;

--create a sequence name
ALTER SEQUENCE users_user_id_seq RESTART WITH 100

CREATE TABLE user2(
	user2_id INT PRIMARY KEY,
	user2_name VARCHAR(50)
);

CREATE SEQUENCE user2_user2_id_seq
START WITH 100 OWNED BY user2.user2_id

ALTER TABLE user2
ALTER COLUMN user2_id SET DEFAULT nextval('user2_user2_id_seq');

INSERT INTO user2 (user2_name) VALUES ('abc')

SELECT * FROM user2;

--LIST all the sequence of the data base
SELECT relname sequence_name
FROM pg_class
WHERE
relkind = 'S';

CREATE SEQUENCE common_fruits_seq START WITH 100 ``