drop database if exists students_hostel;
create database students_hostel char set utf8;

use students_hostel;

create table parents (
    id int not null primary key auto_increment,
    parent_name varchar(45) not null,
    work_place varchar(60) not null,
    tel_number varchar(12) not null,
    student_id int not null
);

create table student (
    id int not null primary key auto_increment,
    student_name varchar(45) not null,
    home_adress varchar(120) not null,
    birth_date date not null,
    group_id int not null,
    room_id int not null
);

create table faculty (
    id int not null primary key auto_increment,
    faculty varchar(130) not null,
    speciality varchar(130) not null unique
);

create table group_t (
    id int not null primary key auto_increment,
    id_group varchar(6) not null unique,
    course tinyint not null,
    speciality_id int not null
);

create table rooms (
    id int not null primary key auto_increment,
    room_number smallint not null unique,
    note text
);

create table furniture (
    id int not null primary key auto_increment,
    invent_number int not null unique,
    furniture_name varchar(30) not null,
    room_id int not null
);

create table incidents (
    id int not null primary key auto_increment,
    incident varchar(30) not null,
    room_id int not null
);

alter table parents add foreign key (student_id) references student(id);
alter table group_t add foreign key (speciality_id) references faculty(id);
alter table student add foreign key (group_id) references group_t(id);
alter table student add foreign key (room_id) references rooms(id);
alter table furniture add foreign key (room_id) references rooms(id);
alter table incidents add foreign key (room_id) references rooms(id);

insert into faculty (faculty, speciality)
    values
        ('Факультет компютерних технологій','IT'),
        ('Факультет компютерних технологій','Програмування'),
        ('Факультет компютерних наук','Адміністрування');

insert into group_t (id_group, course, speciality_id)
    values
        ('К-101',1,1),
        ('К-201',2,1),
        ('К-301',3,1),
        ('К-401',4,1),
        ('К-501',5,1),
        ('А-101',1,2),
        ('А-201',2,2),
        ('А-301',3,2),
        ('А-401',4,2),
        ('А-501',5,2),
        ('Е-101',1,3),
        ('Е-201',2,3),
        ('Е-301',3,3),
        ('Е-401',4,3),
        ('Е-501',5,3);

insert into rooms (room_number)
    values
        (179),
        (204),
        (350),
        (414),
        (549);

insert into furniture (invent_number, furniture_name, room_id)
    values
        (125, 'шафа', 1),
        (126, 'крісло', 1), 
        (127, 'стіл', 1), 
        (128, 'диван', 1),
        (129, 'лампа', 1), 
        (130, 'матрац', 1),
        (225, 'шафа', 2),
        (226, 'крісло', 2), 
        (227, 'стіл', 2), 
        (228, 'диван', 2),
        (229, 'матрац', 2),
        (230, 'лампа', 2), 
        (325, 'шафа', 3),
        (326, 'крісло', 3), 
        (327, 'стіл', 3), 
        (328, 'диван', 3),
        (329, 'лампа', 3), 
        (330, 'матрац', 3),
        (350, 'холодильник', 3), 
        (425, 'шафа', 4),
        (426, 'крісло', 4), 
        (427, 'стіл', 4), 
        (428, 'диван', 4),
        (429, 'матрац', 4),
        (430, 'лампа', 4), 
        (525, 'шафа', 5),
        (526, 'крісло', 5), 
        (527, 'стіл', 5), 
        (528, 'диван', 5),
        (529, 'матрац', 5),
        (530, 'лампа', 5);

insert into incidents (incident, room_id)
    values
        ('бухалово',3),
        ('ригалово',3),
        ('драка',3),
        ('дебош',3);

insert into student (student_name, home_adress, birth_date, group_id, room_id)
    values
        ('Шевченко Степан Омелянович','Київ','1990-01-05',9,1),
        ('Косопизд Омелян Степанович','Полтава','1992-09-12',2,5),
        ('Бульба Тарас Тарасович','Луцьк','1993-02-09',2,4),
        ('Шашлик Азамат Ренатович','Дагестан','1991-03-07',13,3);

insert into parents (parent_name, work_place, tel_number, student_id)
    values
        ('Шевченко Степан Омелянович','Контора 1','0631234567',1),
        ('Косопизд Омелян Степанович','Контора 2','0951234567',2),
        ('Бульба Тарас Тарасович','Контора 2','0971234567',3),
        ('Шашлик Азамат Ренатович','Контора 3','0991234567',4);

select
    student_name, home_adress, birth_date, room_number, incident
from student
    join rooms on student.room_id = rooms.id
    join incidents on incidents.room_id = rooms.id;
    select
    student_name, home_adress, birth_date, room_number, invent_number, furniture_name
from student
    join rooms on student.room_id = rooms.id
    join furniture on furniture.room_id = rooms.id
where room_number = 350;

select
    parent_name, work_place, tel_number, student_name, home_adress, id_group, room_number
from parents
    join student on parents.student_id = student.id
    join group_t on student.group_id = group_t.id
    join rooms on student.room_id = rooms.id
order by student_name desc;
