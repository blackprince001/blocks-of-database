create database compax;

\connect compax;

create table StaffRoom (
    id bigserial primary key not null,
    lecturer_name varchar(80) not null,
    office_number varchar(16) not null
);

create table Building (
    id bigserial primary key not null,
    building_name varchar(40) not null,
    location varchar(40) not null,
    number_of_floors int not null,
    type varchar(40) not null
);

create table ClassRoom (
    id bigserial primary key not null,
    room_name varchar(40) not null,
    capacity int not null,
    type varchar(40) not null
);

create table Schedule ();
