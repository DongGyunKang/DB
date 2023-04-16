select commit(distinct publisher)
from customer, orders, book
where customer.custid=orders.custid 
    and orders.bookid=book.bookid 
    and customer.name like '박지성';
    
select bookname,price,price-saleprice
from customer, orders, book
where customer.cusid=orders.custid
    and orders.bookid=book.bookid
    and customer.name like '박지성';
    
select bookname
from book
where not exists (
    select bookname
    from customer, orders, book
    where customer.custid=orders.custid
        and orders.bookid=book.bookid
        and customer.name like '박지성');

select name
from customer
where name not in (
    select name
    from customer, orders
    where customer.custid=orders.custid);
    
select sum(saleprice),avg(saleprice)
from orders;

select name, sum(saleprice) as total
from customer, orders
where customer.custid=orders.custid
group by name;

select name, book bookname
from customer, orders, book
where customer.custid=orders.custid
    and orders.bookid=book.bookid;
    
select *
from book, orders
where book.bookid=orders.bookid and price-saleprice=(select max(price-saleprice)
                                                        from book, orders
                                                        where book.bookid=orders.bookid);
                                                        
select name, avg(saleprice)
from customer, orders
where customer.custid=orders.custid
group by name
having avg(saleprice)> (select avg(saleprice) from orders);