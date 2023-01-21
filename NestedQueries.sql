SELECT author , title , price 
from book
where price <= (
	SELECT  AVG(price)
	from book
)
order by price DESC;



SELECT author, title, price 
FROM book
WHERE price <= (SELECT min(price)+150 FROM book)
order by price 


select author , title , amount 
from book
where amount in (
	select amount from book
  	group by amount
    having count(amount)=1
);


select author , title , price 
from book 
where price < all(
    select MAX(price)
    from book
    group by(author)
);



select title , author , amount , (select MAX(amount) from book)-amount as Заказ
from book
where amount <> (select MAX(amount) from book);



select * from book
where price in (
    select price from book
    where price > 500
);



