SELECT DISTINCT amount
from book;


select author as Автор , count(title) as Различных_книг , sum(amount) as Количество_экземпляров
from book
group by author;



select author  , MIN(price) as Минимальная_цена , MAX(price) as Максимальная_цена , AVG(price) as Средняя_цена
from book
group by author;



select author ,ROUND(SUM(price*amount),2) as Стоимость , ROUND((SUM(price*amount)*0.18)/1.18,2) as НДС , ROUND(SUM(price*amount)-(SUM(price*amount)*0.18)/1.18,2)  as Стоимость_без_НДС
from book
group by author;



select  MIN(price) as  Минимальная_цена , MAX(price) as Максимальная_цена ,ROUND(AVG(price),2) as  Средняя_цена from book;



select ROUND(AVG(price),2) as Средняя_цена, ROUND(SUM(price*amount),2) as Стоимость
from book
WHERE amount between 5 and 14;



SELECT author ,SUM(amount*price) as Стоимость 
from book
where title <> 'Идиот' and title <>'Белая гвардия' 
GROUP BY author
HAVING SUM(amount*price)>5000 
order by author desc;


SELECT author ,SUM(amount*price) as Стоимость 
from book
where title <> 'Идиот' and title <>'Белая гвардия' 
GROUP BY author
HAVING SUM(amount*price)>5000 
order by author desc;

