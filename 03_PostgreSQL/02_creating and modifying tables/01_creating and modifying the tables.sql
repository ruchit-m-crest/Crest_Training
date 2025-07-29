create table actors (
	actor_id serial primary key,
	first_name varchar(150),
	last_name varchar(150) not null,
	gender char(1),
	date_of_birth date,
	add_date date,
	update_date date,
	add_by varchar(100)
);

create table directors (
	director_id serial primary key,
	first_name varchar(150),
	last_name varchar(150) not null,
	nationality varchar(20),
	date_of_birth date,
	add_date date,
	update_date date
);

select * from directors;

create table movies (
	movie_id serial primary key,
	movie_name varchar(150) not null,
	movie_length int,
	movie_lang varchar(20),
	age_certificate varchar(10),
	release_date date,
	director_id int references directors (director_id)
);

create table movies_revenues (
	revenue_id serial primary key,
	movie_id int references movies (movie_id),
	revenues_domestic numeric(10,2),
	revenues_international numeric(10,2)
);

select * from movies_revenues;

create table movies_actors (
	movie_id int references movies (movie_id),
	actor_id int references actors (actor_id),
	primary key (movie_id,actor_id)
);

select * from movies_actors;

