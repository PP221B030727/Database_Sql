create table supply(
    supply_id INT PRIMARY KEY AUTO_INCREMENT,
    title varchar(50),
    author varchar(30),
    price decimal(8,2),
    amount int 
);


insert into supply(
    supply_id,
    title,
    author,
    price,
    amount 
)
values 
    (1,'Лирика', 'Пастернак Б.Л.', 518.99, 2),
    (2,'Черный человек', 'Есенин С.А.', 570.20, 6),
    (3,'Белая гвардия', 'Булгаков М.А.', 540.50, 7),
    (4,'Идиот', 'Достоевский Ф.М.', 360.80, 3)
    ;



insert into book(title, author, price, amount)
select title, author, price, amount from supply
where author <> 'Булгаков М.А.' and author <> 'Достоевский Ф.М.'




INSERT INTO book (title, author, price, amount) 
SELECT title, author, price, amount 
FROM supply
WHERE title NOT IN (
        SELECT title 
        FROM book
      );

SELECT * FROM book;





update book 
set price = 0.9 * price 
where (amount>=5 and amount <=10);




update book
set buy = if(buy>amount , amount , buy);
update book
set price = if(buy=0 , price * 0.9 , price);



UPDATE book, supply 
set book.amount = supply.amount+book.amount, book.price = (supply.price + book.price)/2
where book.title = supply.title;




DELETE FROM supply
WHERE author IN(SELECT  author 
    FROM book
    GROUP BY author
    HAVING SUM(amount)>10);
SELECT * FROM supply;





create table ordering AS
select author , title , (select AVG(amount) from book) as amount 
from book
where amount < (
    select AVG(amount) from book
);



create table chek as 
select title , author from book 
where price > 400;

