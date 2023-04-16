drop table newBook CASCADE CONSTRAINTSCASCADE CONSTRAINTS;
drop table newcustomer CASCADE CONSTRAINTS;

/*Newbook table ����*/
create table newBook(
bookid number primary key,
bookname varchar2(20) not null,
publisher varchar2(20) unique,
price number default 10000 check(price>1000));

select * from newbook;

/*newcustomer table ����*/
create table newcustomer(
custid number primary key,
name varchar(20),
address varchar2(20),
phone varchar2(30));

/*���ο� ���� ('������ ����', '���ѹ̵��', 10000��)�� ���缭���� �԰�Ǿ���. 
������ �ȵ� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ��ÿ� */
alter table books add (title VARCHAR2(100), publisher VARCHAR2(50), price NUMBER);

insert into book (bookid, bookname, publisher, price) 
values (12, '������ ����', '���ѹ̵��', 10000);

select * from book;

/*'�Ｚ��'���� ������ ������ �����Ͻÿ�. */
delete from book 
where publisher = '�Ｚ��';

select * from book;

/*'�̻�̵��� ������ ������ �����Ͻÿ�. ������ �� �Ǹ� ������ �����غ��ÿ�.'*/


/*���ǻ� '���ѹ̵��'�� '�������ǻ�'�� �̸��� �ٲٽÿ�.*/
update book
set publisher = '�������ǻ�'
where publisher = '���ѹ̵��';

/*(���̺� ����) ���ǻ翡 ���� ������ �����ϴ� ���̺� Bookcompany(name, address, begin)�� �����ϰ��� �Ѵ�.
name�� �⺻Ű�̸� VARCHAR(20), address�� VARCHAR(20), begin�� DATE Ÿ������ �����Ͽ� �����Ͻÿ�.*/

create table Bookcompany (
    name VARCHAR(20) primary key,
    address VARCHAR(20),
    begin DATE
);

/*(���̺� ����)Boocompany ���̺� ���ͳ� �ּҸ� �����ϴ� webaddress �Ӽ���
VARCHAR(30)���� �߰��Ͻÿ�.*/

alter table Boocompany
add webaddress VARCHAR(30);

/*Bookcompany ���̺� ������ ���� name=�Ѻ���ī����, address=����� ������,
begin=1993-01-01, wevaddress=http://hanbit.co.kr�� �����Ͻÿ�.*/

insert into Bookcompany (name, address, begin, webaddress)
VALUES ('�Ѻ���ī����', '����� ������', '1993-01-01', 'http://hanbit.co.kr');
