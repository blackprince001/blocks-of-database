-- A primary key constraint indicates that a column, or group of columns, can be used as a unique identifier for rows in the table.

create table products (
    product_no integer unique not null,
    product_name text,
    price numeric
);

-- should be equivalent to 
create table products (
    product_no integer primary key,
    product_name text,
    price numeric
);

-- We can have more than one column serving as the primary key of table
-- when we have more than one viable candidate key, we group them to form a composite key
create table example (
    a integer,
    b integer,
    c integer,
    primary key (a, c)
);