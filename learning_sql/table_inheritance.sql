create table cities (
    name text,
    population float,
    elevation int -- in feet
);

create table capitals (
    state char(2)
) inherits (cities);

select name, elevation from cities where elevation > 500;

select name, elevation from only cities where elevation > 500;