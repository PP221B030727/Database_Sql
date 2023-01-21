Select * from book;

select author,title,price from book;




select title as Название , author as Автор from book;




select  title , amount , amount*1.65 as pack
from book;



select title , author , amount, round(price * 0.7,2) as new_price
from book;




select  author , title,
    case
        when author = 'Булгаков М.А.' then round(price * 1.1,2)
        when author = 'Есенин С.А.' then round(price * 1.05,2)
        else round(price,2)
    end
    as new_price
from book;



select  author , title,price
from book
where amount<10;



select title,author,price,amount
from book
where (price<500 or price>600) and (amount*price>5000);


select title,author
from book
where price between 540.50 and 800 and amount = 2 or amount = 3 or amount = 5 or amount = 7;



select  author , title
from book
where amount between 2 and 14
order by author desc , title asc;



SELECT title, author FROM book 
Where title LIKE "_% _%" and
(author like '% С._.%' or author like '% _.С.%')
ORDER BY 1 ASC, 2 DESC;