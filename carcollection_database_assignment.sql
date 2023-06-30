drop table if exists CarCollection;

create table CarCollection
(
    id    bigserial primary key not null,
    make  varchar(40)           not null,
    model varchar(40)           not null,
    price numeric(9, 2)         not null
);

insert into CarCollection
(make, model, price)
values ('Honda', 'Civic', 123123.21);

insert into CarCollection (make, model, price)
values ('Aston Martin', 'Valhalla', 542189),
       ('Honda', 'Accord', 475112),
       ('Toyota', 'Vitz', 231056),
       ('Lamborghini', 'Aventador', 105487.55),
       ('Ferrari', '458 Italia', 478000.56),
       ('Aston Martin', 'DBS', 785100.00),
       ('McLaren', '720S', 450000.00),
       ('Honda', 'Civic', 120000.55),
       ('Toyota', 'Yaris', 452000.33),
       ('Mercedes', 'Maybach', 454545.45);

select *
from CarCollection;

select count(*) from CarCollection;

select count(*) as NCars, sum(price)/count(*) as average from CarCollection;

select make, price from CarCollection where price = (select max(price) from CarCollection);

select make, price from CarCollection where price = (select min(price) from CarCollection);

select sum(price) as total_value from CarCollection;

select make, sum(price)/count(*) from CarCollection group by make;

select make, price from CarCollection group by make, price order by price;

select make from CarCollection group by make;
