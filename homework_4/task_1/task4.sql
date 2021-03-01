drop database if exists library;
create database library char set utf8;

use library;

create table author (
    id int not null primary key auto_increment,
    author_name varchar(45) not null,
    author_surname varchar(45) not null,
    author_email varchar(50) not null unique,
    author_adress varchar(120) not null,
#    author_age tinyint not null,
    author_birthday date not null
#    author_awards varchar(120) default null
);

create table category (
    id int not null primary key auto_increment,
    category varchar(30) not null unique
);

create table books (
    id int not null primary key auto_increment,
    book_title varchar(120) not null,
    description text,
#    publication_date date not null default '2018-01-01',
    category_id int not null,
    isbn varchar(20) not null,
    price decimal(5,2) not null default 0.00,
#    number_of_pages smallint not null,
    author_id int not null
);

alter table books add foreign key (category_id) references category(id);
alter table books add foreign key (author_id) references author(id);
