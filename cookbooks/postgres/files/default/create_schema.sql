create user mao with password 'maomao';
alter role mao with createdb;
create database sinatra owner mao;
\connect sinatra
CREATE TABLE presentaciones(
       id     integer NOT NULL PRIMARY KEY,
       fecha  varchar(10) NOT NULL UNIQUE
);
grant all privileges on table presentaciones to mao;

INSERT INTO presentaciones
(id, fecha)
VALUES
(1 , '5 julio');

INSERT INTO presentaciones
(id, fecha)
VALUES
(2 , '25 noviembre');
