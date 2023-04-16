/*Newbook table ����*/
create table newBook(
bookid number primary key,
bookname varchar2(20) not null,
publisher varchar2(20) unique,
price number default 10000 check(price>1000));

select * from newbook;

/*newcustomer table ����*/
create table newcustomer(
custid number PRIMARY KEY,
name varchar(20),
address varchar2(20),
phone varchar2(30));

create table neworders(
orderid number,
custid number   not null,
bookid number   not null,
saleprice number,
orderdate date,
primary key(orderid),
foreign key(custid) references newcustomer(custid) on delete cascade);

/*�Ӽ� �߰�*/
alter table newbook add isbn varchar2(13);

select * from newbook;

/*������� ����*/
alter table newbook modify isbn number;

select * from newbook;
select * from newcustomer;
select * from neworders;

/*���̺� ����*/
drop table newbook;

select * from book;

/*Ʃ�� �߰�*/
insert into book(bookid, bookname, publisher, price)
values(11, '������ ����', '�Ѽ����м���', 90000);

insert into book(bookid, bookname, publisher)
values(14,'����������', '�Ѽ����м���');

select * from imported_book;

/*�뷮 ����*/
insert into book(bookid, bookname, publisher, price)
select bookid, bookname, publisher, price
from imported_book;

select * from customer;

/*������Ʈ*/
update customer
set address = '���ѹα� �λ�'
where cusid = 5;

update customer
set address = (select address from customer where name = '�迬��')
where name = '�ڼ���';

/*Ʃ�û���*/
delete from customer
where custid = 5;

rollback;

