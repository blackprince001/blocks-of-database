-- A PostgreSQL database cluster contains one or more named databases. Roles and a few other object types are shared across the entire cluster. A client connection to the server can only access data in a single database, the one specified in the connection request
-- creating schemas
create database real_database;
create schema my_schema;
my_schema.table -- to access database table of a schemed database.COMMENT
read_database.my_schema.table -- should work the same as the above.

-- dropping schema
drop schema my_schema;
drop schema my_schema cascade;