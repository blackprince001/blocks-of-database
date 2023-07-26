drop database if exists oneFactory;

create database OneFactory;

\connect oneFactory;

drop sequence if exists data_data_seq;

create sequence data_data_seq as int start with 100;

drop table if exists FactoriesData;
create table FactoriesData
(
    id int default nextval("data_data_seq") primary key not null,
    name varchar(100) not null,
    region varchar(30) not null,
    commission_date time,
    rawmaterial varchar(100) not null,
    production_in_tonnes numeric(10, 2) not null
);

-- insert into FactoriesData (name, region, rawmaterial)