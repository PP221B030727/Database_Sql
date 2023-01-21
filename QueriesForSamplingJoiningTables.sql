select book.title , genre.name_genre , book.price from book
inner join genre 
on genre.genre_id = book.genre_id
where book.amount > 8
order by price desc;



select genre.name_genre from genre 
left join book
on book.genre_id = genre.genre_id
where book.genre_id is Null;




select name_city,name_author,(DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND() * 365) DAY)) as Дата
from 
city cross join author
order by name_city asc , Дата desc ; 



select genre.name_genre,book.title,author.name_author from book
inner join genre 
on genre.genre_id = book.genre_id
inner join author 
on book.author_id = author.author_id
where genre.name_genre = 'Роман'
order by book.title asc;



select author.name_author , sum(book.amount) as Количество from book
right join author 
on author.author_id = book.author_id 
group by author.name_author
having sum(book.amount) < 10 or sum(book.amount) is null
order by sum(book.amount) asc;



SELECT name_author
FROM book b INNER JOIN author a
ON b.author_id=a.author_id
GROUP BY name_author
HAVING COUNT(DISTINCT(genre_id))=1



SELECT title, name_author, name_genre, price, amount
FROM book
    INNER JOIN author ON book.author_id = author.author_id
    INNER JOIN genre ON book.genre_id = genre.genre_id
    INNER JOIN   (SELECT genre_id, sum(amount) AS sum_amount
                              FROM book
                              GROUP BY genre_id
                              HAVING sum_amount = (SELECT sum(amount) AS sum_amount
                                                                           FROM book
                                                                           GROUP BY genre_id
                                                                           ORDER BY sum_amount DESC
                                                                           LIMIT 1)) AS temp ON book.genre_id = temp.genre_id
ORDER BY title ASC





select book.title as Название , supply.author as Автор , book.amount+supply.amount as Количество from book
inner join supply using (title)
where supply.price = book.price;


