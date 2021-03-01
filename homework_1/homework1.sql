create database library;
use library;
create table books (
id int not null primary key auto_increment,
book_title varchar(140) not null,
description varchar(1000) default 'Опис відсутній',
publication_date date not null default '2018-01-01',
author varchar(70) not null,
category varchar(30) not null
);
insert into books (book_title, author, category)
values
('Шантарам', 'Грегорі Девід Робертс', 'Роман'),
('Гра на пониження', 'Майкл Льюїс', 'Економіка і математика'),
('Гаррі Поттер і Орден Фенікса', 'Джоан Роулінг', 'Фентезі'),
('World of Warcraft: Arthas: Rise of the Lich King', 'Крісті Голден', 'Фантастика'),
('Хірург', 'Тесс Геррітсен', 'Трилер, Детектив'),
('Кладовище домашніх тварин', 'Стівен Кінг', 'Фантастика,жахи'),
('Воно', 'Стівен Кінг', 'Роман,Фантастика,Жахи,Трилер'),
('Гра престолів', 'Джордж Мартін', 'Роман,Фентезі'),
('Код да Вінчі', 'Ден Браун', 'Роман, Трилер, Детектив'),
('Янголи і демони', 'Ден Браун', 'Роман, Трилер, Саспенс');
select * from books;