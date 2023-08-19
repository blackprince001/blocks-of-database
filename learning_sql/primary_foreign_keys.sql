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
-- Foreign keys
-- A foreign key constraint specifies that the values in a column (or a group of columns) must match the
-- values appearing in some row of another table. We say this maintains the referential integrity between
-- two related tables.
create table orders (
    order_id integer primary key,
    product_no integer references products (product_no),
    quantity integer
);
create table orders (
    order_id integer primary key,
    product_no integer,
    quantity integer,
    foreign key product_no references products (product_no)
);
-- we can reduce the table procedure into a simpler one (not that simpler)
-- which means we dont have to specify the primary key name from the referenced table
create table orders (
    order_id integer primary key,
    product_no integer references products,
    quantity integer
);
-- foreign key constraints
create table t1 (
    a integer primary key,
    b integer,
    c integer,
    foreign key (b, c) references other_table (c1, c2)
);
-- self referential foreign keys
-- In a self-referential foreign key, a table is related to itself. This means that the values in a column of the table are referencing other rows within the same table. The passage is using an example of a table named "tree" to illustrate this concept.
create table tree (
    node_id integer primary key,
    parent_id integer references tree (node_id),
    name text,
);
create table tree (
    node_id integer primary key,
    parent_id integer,
    foreign key parent_id references tree (node_id)
);
-- foreign keys for many-to-many relationships
create table products (
    product_no integer primary key,
    product_name text,
    price numeric
);
create table orders (
    order_id integer primary key,
    shipping_addr text,
);
create table order_items (
    product_no integer references products,
    order_id integer references orders,
    quantity integer,
    primary key (product_no, order_id)
);
-- policies on many-to-many relationships
-- when an item referenced in another table gets deleted
create table order_items (
    product_no integer references products on delete restrict,
    order_id integer references orders on delete cascade,
    quantity integer,
    primary key (product_no, order_id)
);
-- this means we can remove a product to which we want to order quantities of
-- only when we have an order placed with links the product_no
-- if it doesnt, we restrict removing the product but delete on cascade when we
-- just want to remove that order.
-- some other policies include under DELETE
-- NO ACTION
-- SET NULL
-- SET DEFAULT -- all get combined with 
--     ON DELETE -- to make policies for rows and columns on a table
CREATE TABLE tenants (tenant_id integer PRIMARY KEY);
CREATE TABLE users (
    tenant_id integer REFERENCES tenants ON DELETE CASCADE,
    user_id integer NOT NULL,
    PRIMARY KEY (tenant_id, user_id)
);
CREATE TABLE posts (
    tenant_id integer REFERENCES tenants ON DELETE CASCADE,
    post_id integer NOT NULL,
    author_id integer,
    PRIMARY KEY (tenant_id, post_id),
    FOREIGN KEY (tenant_id, author_id) REFERENCES users ON DELETE
    SET NULL (author_id)
);
-- some other policies include under UPDATE
-- NO ACTION
-- SET NULL
-- SET DEFAULT -- all get combined with 
--     ON DELETE -- to make policies for rows and columns on a table
