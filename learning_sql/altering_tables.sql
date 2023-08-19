-- Modifying tables
-- When you create a table and you realize that you made a mistake, or the requirements of the application
-- change, you can drop the table and create it again. But this is not a convenient option if the table is
-- already filled with data, or if the table is referenced by other database objects (for instance a foreign key
-- constraint). Therefore PostgreSQL provides a family of commands to make modifications to existing
-- tables. Note that this is conceptually distinct from altering the data contained in the table: here we are
-- interested in altering the definition, or structure, of the table.
-- what can you do to tables?
-- You can:
-- • Add columns
alter table products
add column description text;
alter table products
add column description text check (description <> '');
-- we can also add constraints when adding new columns
-- • Remove columns
alter table products drop column description;
alter table products drop column description cascade;
-- if the column is referenced somewhere
-- • Add constraints
alter table products
add check (name <> '');
alter table products
add constraint some_name unique (product_no);
alter table products
add foreign key (product_group_id) references product_groups;
alter table products
alter column product_no
set not null;
-- • Remove constraints
alter table products drop constraint some_name;
-- that is if you named your constraint
-- • Change default values
alter table products
alter column price
set default 0.99;
alter table products
alter column price drop default;
-- • Change column data types
alter table products
alter column price type numeric(10, 2);
-- • Rename columns
alter table products
    rename column product_no to product_number;
-- • Rename tables
alter table products
    rename to items;