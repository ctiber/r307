docker run --name postgres-db --rm -P -p 127.0.0.1:5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -d postgres
docker ps
docker stop postgres-db
docker volume create app_vol
docker run --name postgres-db --rm -P -p 127.0.0.1:5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -v app_vol:/var/lib/postgresql -d postgres
docker exec -it postgres-db psql -U postgres
---------------------------------------------
CREATE DATABASE app_db;
\l
\c app_db
CREATE TABLE users(
    user_id serial NOT NULL PRIMARY KEY,
    first_name varchar(30) NOT NULL,
    last_name varchar(30) NOT NULL,
    email varchar(80) NOT NULL,
    phone_number varchar(20) NOT NULL,
    password varchar(100) NOT NULL
);
\d
\d users
CREATE EXTENSION pgcrypto;
INSERT INTO users(first_name,last_name,email,phone_number,password) VALUES
('Harry','Potter','harry.potter@gmail.com','+44 123456789', crypt('1234',gen_salt('bf', 8)));
SELECT * FROM users;
\q
---------------------------------------------
