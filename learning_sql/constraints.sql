-- CHECK constraint
-- It allows you to specify that the value in a certain column
-- must satisfy a Boolean (truth-value) expression.

create table Items (
    id integer,
    lt_index text,
    price numeric check (price > 0)
);

-- OR this for better error messaging...
create table Items (
    id integer, 
    It_index text,
    price numeric constraint positive_price check (price > 0)
);

-- we can also refer to several columns when using the check constraint
-- we use the discount_price column to check if any discount value is always
-- less than the value of the item.
create table Items (
    id integer, 
    It_index text,
    price numeric check (price > 0),
    discounted_price numeric check (discounted_price > 0),
    check (discounted_price < price)
);

-- we can also add product_names to the checks to ensure we get better error messaging
create table Items (
    id integer, 
    It_index text,
    price numeric check (price > 0),
    discounted_price numeric check (discounted_price > 0),
    constraint valid_discount check (discounted_price < price)
);

-- Checks can have their own line of tokenization which should be similar to the block above.
create table Items (
    id integer, 
    It_index text,
    price numeric,
    check (price > 0),
    discounted_price numeric,
    check (discounted_price > 0),
    constraint valid_discount check (discounted_price < price)
);

-- NOT NULL constraints

create table products (
    product_no integer not null,
    product_name text not null,
   price numeric 
);

-- this should be similar to the block above but since NOT NULL is efficient, we can
-- forgo the need to the check, which also works the product_name but you can product_names to the constraints ... 
-- unlike with the NOT NULL alone.
create table products (
    product_no integer constraint shell_product_no check (product_no is not null),
    product_name text not null,
   price numeric 
);

-- UNIQUE constraints
    -- column constraint for unique
create table products (
    product_no integer UNIQUE,
    product_name text,
    price numeric
);
    -- table constraint for unique
create table products (
    product_no integer,
    product_name text,
    price numeric,
    UNIQUE (product_no)
);

-- we can constrain multiple columns in a table
create table example (
    a integer,
    b integer, 
    c integer,
    UNIQUE (a, b)
);

-- we can assign product_names to the constraints 
create table products (
    product_no intger constraint must_be_different unique,
    product_name text,
    price numeric
);

-- we use nulls not distinct phrase to prevent rare situations where
-- unique columns are still populated with equal data
create table products (
    product_no integer,
    product_name text,
    price numeric,
    unique NULLS NOT DISTINCT (product_no)
);