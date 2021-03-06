drop database if exists library;
create database library char set utf8;
use library;
create table books (
id int not null primary key auto_increment,
book_title varchar(120) not null,
description text,
publication_date date not null default '2018-01-01',
category varchar(30) not null,
isbn varchar(20) not null unique,
number_of_pages smallint not null,
author_name varchar(45) not null,
author_surname varchar(45) not null,
author_email varchar(50) not null,
author_age tinyint not null,
author_birthday date not null,
author_awards varchar(120) default null
);
insert into books (book_title, description, publication_date, category, isbn, number_of_pages, author_name, author_surname, author_email, author_age, author_birthday, author_awards)
values
('Вбивство в "Східному експресі"','На цей раз Еркюлю Пуаро доведеться розслідувати вбивства в поїздах. У «Східному експресі» йому доведеться розплутувати клубок подій, закручений навколо жорстокого вбивства, - і лише тільки блискучі таланти великого сищика здатні допомогти розкрити злочин.','1991-01-01','Детектив','5-145-4589-89',110,'Агата','Кристи','agathachristie@gmail.com',85,'1890-09-15','Орден Британської імперії'),
('Ангели і демони','Ілюмінати. Древній таємничий орден, що прославився в середні віки лютою боротьбою з офіційною церквою. Легенда далекого минулого? Можливо ... Але чому тоді на грудях убитого при загадкових обставинах ученого вирізаний саме символ ілюмінатів? Запрошений з Гарварду фахівець з символіки і його напарниця, дочка вбитого, починають власне розслідування і незабаром приходять до неймовірних результатів','2004-01-01','Исторические детективы','5-9577-0201-3',330,'Дэн','Браун','DanBrown@gmail.com',54,'1964-06-22','Crimezone Thriller Awards (2004)'),
('Мовчання ягнят','Протистояння дівчини, що розслідує «діяння» серійного вбивці, - і її «консультанта і союзника», маніяка і філософа Ганнібала Лектера, що сидить у вязниці за вбивства і людожерство. Тут кожна фраза наближає читача до хвилюючої розгадки - і одночасно змушує шукати цю розгадку самостійно','1991-01-01','Триллеры','5-125-14579-54',200,'Томас','Харрис','thomasharris@gmail.com',78,'1940-04-11',default),
('Втеча з Шоушенка','Книга «Втеча з Шоушенка» зєднує жахи тюремного життя і фантастику втечі. Шоушенк - назва вязниці. Енді, віце-президент солідного банку, засуджується до двох довічних увязнень за обвинуваченням в убивстві дружини і її коханця. Він відбуває увязнення в тюрмі Шоушенк, де проходить всі кола пекла, проявляючи незвичайну мужність, завзятість і холоднокровність. Якщо тобі немає ще 30-ти, а ти отримуєш довічне, то Приготуйся до гіршого: для тебе виходу з Шоушенка не буде.','1982-01-01','Трилери','5-324-17853-77',260,'Стивен','Кинг','StephenKing@gmail.com',71,'1947-09-21','премия Эдгара Аллана По'),
('Джен Ейр','Поява скромною, милою гувернантки в похмурому замку Рочестера немов несе з собою світло, зігріває душі його мешканців. Зловісні таємниці розсіюються, страхи відступають перед цією тендітною на вигляд, але такої сильної духом дівчиною. І коли вона починає боротьбу за свою любов, ніякі сили зла не можуть зупинити її.','1988-01-01','Классическая проза','6-145-45789-22',124,'Шарлотта','Бронте','charlottebronte@gmail.com',38,'1816-04-21',default),
('Дари волхвів','Дарунки волхвів - повість О. Генрі (Вільяма Сідні Портера) про двох молодят, які живуть в тісній кімнатці і що зазнають фінансові проблеми. Незважаючи на це, вони намагаються зробити один одному пріятное- подарувати подарунки. І для цього вони повинні пожертвувати тим, що для них дорого. Подарунки - це не головне, звичайно, а головне увага, турбота і любов, які відчули наші герої. Вони розуміють справжнє щастя.','2005-01-01','Классическая проза','5-271-12647-1',301,'Вильям Сидни','Портер','O.Henry@gmail.com',47,'1862-09-11',default),
('Майстер і Маргарита','Роман «Майстер і Маргарита» - візитна картка Михайла Опанасовича Булгакова. Більше десяти років Булгаков працював над книгою, яка стала його романом-долею, романом-заповітом. У «Майстрі і Маргариті» є все: веселе пустощі і щемлива смуток, романтична любов і чаклунське мана, магічна таємниця і безрозсудна гра з нечистою силою.','2006-01-01','Классическая проза','5-699-15500-7',391,'Михаил','Булгаков','bulgakov@gmail.com',48,'1891-05-15',default),
('Гаррі Поттер і філософський камінь','Одинадцятирічний хлопчик-сирота Гаррі Поттер живе в родині своєї тітки і навіть не підозрює, що він - справжній чарівник. Але одного разу прилітає сова з листом для нього, і життя Гаррі Поттера змінюється назавжди. Він дізнається, що зарахований до Школи чарівництва й чарівництва, зясовує правду про загадкову смерть своїх батьків, а в результаті йому вдається розкрити секрет філософського каменю.','2002-01-01','Детские приключения','5-353-00308-X',135,'Джоан','Роулинг','JoanneRowling@gmail.com',53,'1965-07-31','Орден Почетного легиона'),
('Пригоди Тома Сойєра і Гекльберрі Фінна','Герой цього твору розумний, добрий, вміє по-справжньому дружити і знає ціну людям. Волелюбність, самостійність і кмітливість зробили Гека Фінна одним з найулюбленіших героїв підлітків різних країн.','1958-01-01','Детские приключения','1-555-25749-22',185,'Марк','Твен','MarkTwain@gmail.com',74,'1835-11-30',default),
('Маленький принц','В одному з листів до матері Сент-Екзюпері зізнався: "Мені ненависні люди, які пишуть заради забави, які шукають ефектів. Треба мати що сказати ". Йому, романтику неба, не цураються земних радощів, любив, за свідченням друзів, "писати, говорити, співати, грати, докопуватися до суті речей, є, звертати на себе увагу, доглядати за жінками", людині проникливого розуму зі своїми достоїнствами і недоліками , але завжди стояв на захисті загальнолюдських цінностей, було "що сказати". І він це зробив: написав казку "Маленький принц", про найважливіше в цьому житті, життя на планеті Земля, все частіше такий неласкавій, але коханою і єдиною.','1982-01-01','Детская проза','899-125-78913-12',55,'Антуан','де Сент-Экзюпери','AntoinedeSaint-Exupery@gmail.com',44,'1900-06-29','Орден Почетного легиона');
select * from books;
select * from books where id = 5 or id = 10 or id = 13;
select * from books where number_of_pages > 150;
select * from books where author_age > 30;
select * from books where author_awards is null;
select * from books where author_email = 'bulgakov@gmail.com';
select * from books where isbn = '6-145-45789-22';
select * from books where category = 'Трилери';
select * from books where number_of_pages > 200 and author_age > 25;
select * from books where category = 'Детектив' or category = 'Трилери';
select * from books order by book_title asc;
select * from books order by author_email asc;
select * from books order by number_of_pages desc;
select distinct category from books;
select distinct author_name from books;
select * from books where publication_date > '2000-01-01';
select * from books where publication_date < '2010-01-01';