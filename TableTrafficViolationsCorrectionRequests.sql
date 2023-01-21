create table fine(
    fine_id INT primary key auto_increment,
    name varchar(30),
    number_plate varchar(6),
    violation varchar(50),
    sum_fine DECIMAL(8,2),
    date_violation DATE,
    date_payment DATE
);



insert into fine(
    name,number_plate,violation,sum_fine,date_violation,date_payment
)
values ('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', null, '2020-02-14', null),
('Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', null, '2020-02-23', null),
('Яковлев Г.Р.', 'Т330ТТ', 'Проезд на запрещающий сигнал', null, '2020-03-03', null);



update fine as f , traffic_violation as tv

set f.sum_fine = tv.sum_fine
where(f.violation = tv.violation) and f.sum_fine is NULL;

select * from fine;


select name , number_plate , violation from fine 
group by name , number_plate,violation
having count(*)>1
order by name,number_plate,violation asc;


update fine , 
(select name , number_plate , violation from fine 
group by name , number_plate,violation
having count(*)>1
order by name,number_plate,violation asc) query_in
set sum_fine = sum_fine * 2
where  date_payment is null and fine.name = query_in.name and fine.number_plate = query_in.number_plate and fine.violation = query_in.violation;


update fine , payment 
set 
    fine.date_payment = payment.date_payment,
    fine.sum_fine = if(DATEDIFF(payment.date_payment,payment.date_violation)<21 ,fine.sum_fine/2,fine.sum_fine)
where
    fine.name = payment.name 
    and fine.number_plate  = payment.number_plate
    and fine.violation = payment.violation 
    and fine.date_violation = payment.date_violation 
    and fine.date_payment is NULL 
;






select * from fine;






create table back_payment(
    SELECT name, number_plate, violation, sum_fine, date_violation   
    FROM fine
    WHERE date_payment IS NULL
);



DELETE FROM fine
where DATEDIFF(date_violation,'2020-02-01')<0;