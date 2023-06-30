drop table if exists students;
drop table if exists courses;
drop table if exists instructors;
drop table if exists course_registration;

create table students (
    student_id bigserial primary key not null,
    name varchar(80) not null,
    dob date not null
);

create table courses (
    code bigserial primary key not null,
    title varchar(40) not null,
    credit_hours integer not null
);

create table instructors (
    id bigserial primary key not null,
    name varchar(80) not null,
    specialization varchar(40) not null
);

create table course_registration (
    id bigserial primary key not null,
    student_id integer not null,
    course_code integer not null,
    instructor_id integer not null,
    foreign key (student_id) references students (student_id),
    foreign key (course_code) references courses (code),
    foreign key (instructor_id) references instructors (id)
);