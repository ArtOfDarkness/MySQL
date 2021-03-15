drop database if exists social_network;
create database social_network char set utf8;

use social_network;

create table users (
    id int not null primary key auto_increment,
    first_name varchar(40) not null,
    last_name varchar(50) not null,
    email varchar(50) not null unique,
    nickname varchar(130) default null,
    birthday date,
    created_at timestamp default now()
);

create table photoes (
    id int not null primary key auto_increment,
    image_url varchar(255) not null,
    user_id int not null,
    created_at timestamp default now()
);

create table albums (
    id int not null primary key auto_increment,
    album_name varchar(120) not null,
    user_id int not null,
    created_at timestamp default now()
);

create table album_photo (
    album_id int not null,
    photo_id int not null,
    primary key(album_id, photo_id)
);

create table messages (
    id int not null primary key auto_increment,
    message_text varchar(255) not null,
    message_author_id int not null,
    created_at timestamp default now()
);

create table message_recipients (
    message_id int not null,
    message_recipient_id int not null,
    primary key(message_id, message_recipient_id)
);

create index idx_nickname on users(nickname);

alter table photoes add foreign key (user_id) references users(id);
alter table albums add foreign key (user_id) references users(id);
alter table album_photo add foreign key (album_id) references albums(id);
alter table album_photo add foreign key (photo_id) references photoes(id);
alter table messages add foreign key (message_author_id) references users(id);
alter table message_recipients add foreign key (message_id) references messages(id);
alter table message_recipients add foreign key (message_recipient_id) references users(id);

insert into users (first_name, last_name, email, nickname, birthday)
    values
        ('Артур','Конан Дойл','ArthurConanDoyle@gmail.com','ConanWarrior','1859-05-22'),
        ('Агата','Кристи','AgathaChristie@gmail.com','А убийца — дворецкий','1890-09-15'),
        ('Жорж','Сименон','GeorgesSimenon@gmail.com','Жора','1903-02-13'),
        ('Дэн','Браун','DanBrown@gmail.com','„Розенкрейцеры“ за 100','1964-06-22'),
        ('Томас','Харрис','ThomasHarris@gmail.com',null,'1940-04-11'),
        ('Стивен','Кинг','StephenKing@gmail.com','Дорогой, пришли счета, у меня ПМС, в кладовке монстр','1947-09-21'),
        ('Жан-Кристоф','Гранже','Jean-ChristopheGrange@gmail.com',null,'1961-07-15'),
        ('Жюль','Верн','JulesVerne@gmail.com',null,'1905-03-24'),
        ('Дэниел','Киз','DanielKeyes@gmail.com',null,'1927-08-09'),
        ('Александр','Беляев','beliayev@gmail.com',null,'1884-03-16'),
        ('Аркадий','Стругацкий','a_strugatskiy@gmail.com',null,'1925-08-28'),
        ('Борис','Стругацкий','b_strugatskiy@gmail.com',null,'1933-04-15'),
        ('Эрих Мария','Ремарк','ErichMariaRemarque@gmail.com','Я - мужик!','1898-06-22'),
        ('Джек','Лондон','JackLondon@gmail.com','Fuck GPS!','1876-01-12'),
        ('Шарлотта','Бронте','CharlotteBronte@gmail.com',null,'1816-04-21'),
        ('Вильям Сидни','Портер','O.Henry@gmail.com','О.Генри','1862-09-11'),
        ('Михаил','Булгаков','bulgakov@gmail,com','МиШа','1891-05-15'),
        ('Джоан','Роулинг','JoanneRowling@gmail.com','Ну хоть что-то читают','1965-07-31'),
        ('Марк','Твен','MarkTwain@gmail.com',null,'1835-11-30'),
        ('Антуан','де Сент-Экзюпери','AntoinedeSaint-Exupery@gmail.com',null,'1900-06-29');

insert into photoes (image_url, user_id)
    values
        ('http://elijah.biz', 1),
        ('https://shanon.org', 1),
        ('http://vicky.biz', 1),
        ('http://oleta.net', 3),
        ('https://jennings.biz', 3),
        ('https://quinn.biz', 2),
        ('https://selina.name', 2),
        ('http://malvina.org', 4),
        ('https://branson.biz', 5),
        ('https://elenor.name', 8),
        ('https://marcelino.com', 8),
        ('http://felicity.name', 12),
        ('https://fred.com', 12),
        ('https://gerhard.biz', 14),
        ('https://sherwood.net', 14),
        ('https://maudie.org', 15),
        ('http://annamae.name', 16),
        ('https://mac.org', 16),
        ('http://miracle.info', 17),
        ('http://emmet.com', 18);

insert into albums (album_name, user_id)
    values
        ('Lorem ipsum', 1),
        ('Dolor sit amet', 2),
        ('Consectetur adipiscing elit', 3),
        ('Suspendisse consequat', 4),
        ('Euismod tempor', 5),
        ('Nam porttitor', 8),
        ('Vulputate risus eget', 12),
        ('Blandit Donec', 14),
        ('Urna arcu', 15),
        ('Cursus vitae leo', 18);

insert into album_photo (album_id, photo_id)
    values
        (1, 13),
        (1, 15),
        (1, 4),
        (1, 5),
        (2, 6),
        (2, 19),
        (3, 2),
        (3, 20),
        (3, 8),
        (5, 8),
        (5, 10),
        (5, 7),
        (5, 17),
        (6, 17),
        (6, 8),
        (6, 18),
        (7, 9),
        (9, 15),
        (10, 16),
        (10, 11);

insert into messages (message_text, message_author_id)
    values
        ('Fusce ac risus non velit elementum pharetra', 11),
        ('Quisque bibendum mi fermentum risus maximus', 4),
        ('Proin viverra neque quis nisl tempus', 12),
        ('Pellentesque et mollis enim', 7),
        ('Maecenas vel felis nec sem euismod congue sit amet ut purus', 16),
        ('Sed tristique diam lacinia nisi efficitur, vel pulvinar nisl auctor', 20),
        ('In enim sapien, imperdiet vel justo eu, molestie placerat augue', 15),
        ('Phasellus ut lacinia sem', 1),
        ('Nam tempor sit amet augue ut luctus', 13),
        ('Proin non lectus lectus', 5),
        ('Cras bibendum in ex quis gravida', 17),
        ('Cras sit amet urna a sapien commodo pellentesque', 9),
        ('Aliquam posuere sapien a magna blandit, ut pretium eros porttitor', 8),
        ('In non ante nisi', 19),
        ('Nullam mattis sagittis risus quis efficitur', 3),
        ('Suspendisse a eleifend justo, a pulvinar dui', 14),
        ('Etiam lobortis consequat orci, a luctus odio posuere ac', 2),
        ('Proin varius massa a lobortis gravida', 18),
        ('Donec sed sagittis magna', 10),
        ('Nam rhoncus libero vitae arcu porttitor efficitur eu nec tellus', 6);

insert into message_recipients (message_id, message_recipient_id)
    values
        (1, 6),
        (2, 3),
        (3, 14),
        (4, 6),
        (4, 1),
        (5, 1),
        (6, 19),
        (6, 10),
        (6, 14),
        (7, 7),
        (7, 9),
        (7, 8),
        (7, 12),
        (8, 6),
        (8, 7),
        (9, 16),
        (10, 7),
        (11, 19),
        (12, 4),
        (12, 18),
        (13, 19),
        (14, 12),
        (15, 7),
        (16, 13),
        (16, 16),
        (17, 4),
        (18, 12),
        (19, 8),
        (19, 6),
        (20, 19);

select * from users;
select * from users order by birthday limit 1,5;
select * from users order by birthday desc limit 1,5;
select * from users where nickname is null;
select id, message_text from messages where message_text like '_ras%';
select id, message_text from messages where message_text like '%amet%';
select count(photo_id) from album_photo where album_id=2;
select ucase(message_text) from messages where id=10;
select lcase(message_text) from messages where id=15;
select message_text, nickname from messages join users on message_author_id = users.id where messages.id in (8, 15, 16, 17);
select first_name, last_name from photoes right join users on user_id = users.id where image_url is null;
select distinct first_name, last_name from photoes right join users on user_id = users.id where image_url is not null;
select first_name, last_name, image_url from photoes join users on user_id = users.id;
select first_name, last_name from albums right join users on user_id = users.id where album_name is null;
select distinct first_name, last_name from albums right join users on user_id = users.id where album_name is not null;
select first_name, last_name, album_name from albums join users on user_id = users.id;
select album_name, image_url from album_photo join albums on album_id = albums.id join photoes on photo_id = photoes.id;
select album_name, image_url, first_name, last_name from album_photo join albums on album_id = albums.id join photoes on photo_id = photoes.id join users on photoes.user_id = users.id order by album_name;
select first_name, last_name from messages right join users on message_author_id = users.id where message_text is null;
select message_text, first_name, last_name from messages join users on message_author_id = users.id;
