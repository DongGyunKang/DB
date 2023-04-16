select *
from   Book;

select *
from   Customer;

select *
from   Orders;

/*�������� ������ ������ ���ǻ� ��*/
select count(distinct b.publisher)
from   Book b, Customer c, Orders o
where  c.custid = o.custid
and    b.bookid = o.bookid
and    c.name like '������';

/*����ȣ 1��( = ������)�� ������ ������ ���ǻ� ��*/
select count(distinct b.publisher)
from   Book b, Orders o
where  b.bookid = o.bookid
and    o.custid = 1;

/*�������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����*/
select b.bookname, b.price, b.price - o.saleprice
from   Book b, Customer c, Orders o
where  c.custid = o.custid
and    b.bookid = o.bookid
and    c.name like '������';

/*�������� �������� ���� ������ �̸�*/
select bookname
from   Book
where  bookid not in (
                        select o.bookid
                        from   Customer c, Orders o
                        where  c.custid = o.custid
                        and    c.name   like '������'
                     );

/*�������� �������� ���� ������ �̸�2*/
select bookname
from   Book
where  not exists (
                    select bookname
                    from   Customer, Orders 
                    where  book.bookid = orders.bookid
                    and    customer.custid = orders.custid
                    and    customer.name like '������'
                  );

/*�ֹ����� ���� ���� �̸�(�μ����� ���)*/
select name
from   Customer
where  name not in (
                     select c.name
                     from   Customer c, Orders o
                     where  c.custid = o.custid
                    );

/*�ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�*/
select sum(saleprice), avg(saleprice)
from   Orders;

/*���� �̸��� ���� ���ž�*/
select c.name, sum(o.saleprice) as purchase
from   Customer c, Orders o
where  c.custid = o.custid
group  by c.name;

/*���� �̸��� ���� ������ ���� ���*/
select c.name, b.bookname
from   Book b, Customer c, Orders o
where  b.bookid = o.bookid
and    c.custid = o.custid;

/*������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�*/
select b.bookname
from   Book b, Orders o 
where  b.bookid = o.bookid
and    b.price - o.saleprice in ( 
                                  select max(b.price - o.saleprice)
                                  from   Book b, Orders o
                                  where  b.bookid = o.bookid
                                );

/*������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�*/
select name
from   Customer
where  custid in (
                   select o1.custid
                   from   Orders o1, Orders o2
                   group  by o1.custid
                   having avg(o1.saleprice) > avg(o2.saleprice)
                 );

select c.name, avg(o.saleprice)
from   Customer c, Orders o
where  c.custid = o.custid
group  by c.name
having avg(o.saleprice) > (
                            select avg(saleprice)
                            from   Orders
                          );