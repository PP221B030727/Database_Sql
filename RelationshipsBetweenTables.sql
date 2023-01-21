create table author(
    author_id int primary key auto_increment,
    name_author VARCHAR(50)
    
);



insert into author(author_id,name_author)
values 
(1,'Булгаков М.А.'),
(2,'Достоевский Ф.М.'),
(3,'Есенин С.А.'),
(4,'Пастернак Б.Л.');



create table book(
    book_id int primary key auto_increment,
    title varchar(50),
    author_id int not null,
    genre_id int ,
    price DECIMAL(8, 2) ,
    amount int,
    foreign key (author_id) references author(author_id),
    foreign key (genre_id) references genre(genre_id)
);




create table book(
    book_id int primary key auto_increment,
    title varchar(50),
    author_id int not null,
    genre_id int ,
    price DECIMAL(8, 2) ,
    amount int,
    foreign key (author_id) references author(author_id) on delete cascade,
    foreign key (genre_id) references genre(genre_id) on delete set null
);




insert into book(
    book_id,
    title,
    author_id,
    genre_id,
    price,
    amount
)
values
    (6,'Стихотворения и поэмы',3,2,650.00,15),
    (7,'Черный человек',3,2,570.20,6),
    (8,'Лирика',4,2,518.99,2)