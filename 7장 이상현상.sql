DROP TABLE Summer;

CREATE TABLE Summer (
    sid NUMBER,
    class VARCHAR2(20),
    price NUMBER
);

INSERT INTO Summer VALUES (100, 'FORTRAN', 20000);
INSERT INTO Summer VALUES (150, 'PASCAL', 15000);
INSERT INTO Summer VALUES (200, 'C', 10000);
INSERT INTO Summer VALUES (250, 'FORTRAN', 20000);

SELECT *
FROM Summer;

SELECT sid, class
FROM Summer;

select price
from Summer
where class='C';

select distinct class
from Summer
where price=(select max(price)
    from Summer);

select count(*), sum(price)
from Summer;

/*C ���� 200�� �л��� ������û ����*/


delete 
from summer 
where sid=200;

/*C ���� ������ �ٽ� ��ȸ*/

select price "C ������"
from Summer
where class='C';

/*�ڹ� ���� �߰�*/
insert into Summer values (null, 'JAVA', 25000);

select *
from Summer;

/**/
select count(*) as "�����ο�"
from Summer;

select count(sid) as "�����ο�"
from Summer;

select count(*) as "�����ο�"
from Summer
where sid is not null;


/*FORTRAN ���� ������ ����*/
update Summer
set price=15000
where class='FORTRAN';

select *
from Summer;

select distinct price "FORTRAN ������"
from Summer
where class='FORTRAN';

/*���� �ǽ��� ���� FORTRAN ������ �����Ḧ 20000������ ����*/
update Summer
set price=20000
where class='FORTRAN';

/*���� update ���� ������ ���� �ۼ��Ǹ� ������ ����ġ ������ �߻���*/
update Summer
set price=15000
where class='FORTRAN' and sid=100;

select *
from Summer;

/*����*/
update Summer
set price=20000
where class='FORTRAN' and  sid=100;

drop table SummerEnroll;
drop table Summerprice;
drop table Summer;

/*SummerPrice ���̺� ����*/
create table SummerPrice(
    class varchar(20),
    price integer);

insert into SummerPrice values ('FORTRAN', 20000);
insert into SummerPrice values ('PASCAL', 15000);
insert into SummerPrice values ('C', 10000);

    
/*Summerenroll ���̺� ����*/
create table SummerEnroll(
    sid integer,
    class varchar(20));

insert into SummerEnroll values (100, 'FORTRAN');
insert into SummerEnroll values (150, 'PASCAL');
insert into SummerEnroll values (200, 'C');
insert into SummerEnroll values (250, 'FORTRAN');

select *
from SummerPrice;

select *
from SummerEnroll;



/*�����б⸦ ��� �л��� �й��� �����ϴ� ������?*/

select sid,class
from SummerEnroll;

/*C ������ �������?*/

select price
from SummerPrice
where class='C';

/*�����ᰡ ���� ��� ������?*/

select distinct class
from SummerPrice
where price=(select max(price)
    from SummerPrice);
    
/*�����б⸦ ��� �л� ���� ������ �Ѿ���?*/
select count(*), sum(price)
from SummerPrice, SummerEnroll
where SummerPrice.class = SummerEnroll.class;

/*20�� �л��� �����б� ������û�� ����Ͻÿ�.*/
select price as "C ������"
from SummerPrice
where class='C';

/*200���л� ����*/
delete from SummerEnroll
where sid=200;

select *
from SummerEnroll;


/*C ������ �����ᰡ �����ϴ��� Ȯ��*/
select price "C ������"
from SummerPrice
where class='C';


/*�ڹ� ���� ����, null���� �Է��� �ʿ� ����*/
insert into SummerPrice values ('JAVA', 25000);

select *
from SummerPrice;

select *
from SummerEnroll;

/*FORTRAN ������ �����Ḧ 20000������ 15000������ �����Ͻÿ�*/
update SummerPrice
set price=15000
where class='FORTRAN';

select price "FORTRAN ������"
from SummerPrice
where class='FORTRAN';

select *
from SummerPrice;