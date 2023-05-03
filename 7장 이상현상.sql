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

/*C 강좌 200번 학생의 수강신청 삭제*/


delete 
from summer 
where sid=200;

/*C 강좌 수강료 다시 조회*/

select price "C 수강료"
from Summer
where class='C';

/*자바 강좌 추가*/
insert into Summer values (null, 'JAVA', 25000);

select *
from Summer;

/**/
select count(*) as "수강인원"
from Summer;

select count(sid) as "수강인원"
from Summer;

select count(*) as "수강인원"
from Summer
where sid is not null;


/*FORTRAN 강좌 수강료 수정*/
update Summer
set price=15000
where class='FORTRAN';

select *
from Summer;

select distinct price "FORTRAN 수강료"
from Summer
where class='FORTRAN';

/*다음 실습을 위해 FORTRAN 강좌의 수강료를 20000원으로 복구*/
update Summer
set price=20000
where class='FORTRAN';

/*만약 update 문을 다음과 같이 작성되면 데이터 불일치 문제가 발생함*/
update Summer
set price=15000
where class='FORTRAN' and sid=100;

select *
from Summer;

/*복구*/
update Summer
set price=20000
where class='FORTRAN' and  sid=100;

drop table SummerEnroll;
drop table Summerprice;
drop table Summer;

/*SummerPrice 테이블 생성*/
create table SummerPrice(
    class varchar(20),
    price integer);

insert into SummerPrice values ('FORTRAN', 20000);
insert into SummerPrice values ('PASCAL', 15000);
insert into SummerPrice values ('C', 10000);

    
/*Summerenroll 테이블 생성*/
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



/*계절학기를 듣는 학생의 학번과 수강하는 과목은?*/

select sid,class
from SummerEnroll;

/*C 강좌의 수강료는?*/

select price
from SummerPrice
where class='C';

/*수강료가 가장 비싼 과목은?*/

select distinct class
from SummerPrice
where price=(select max(price)
    from SummerPrice);
    
/*계절학기를 듣는 학생 수와 수강룍 총액은?*/
select count(*), sum(price)
from SummerPrice, SummerEnroll
where SummerPrice.class = SummerEnroll.class;

/*20번 학생의 계절학기 수강신청을 취소하시오.*/
select price as "C 수강료"
from SummerPrice
where class='C';

/*200번학생 삭제*/
delete from SummerEnroll
where sid=200;

select *
from SummerEnroll;


/*C 강좌의 수강료가 존재하는지 확인*/
select price "C 수강료"
from SummerPrice
where class='C';


/*자바 강좌 삽입, null값을 입력할 필요 없음*/
insert into SummerPrice values ('JAVA', 25000);

select *
from SummerPrice;

select *
from SummerEnroll;

/*FORTRAN 강좌의 수강료를 20000원에서 15000원으로 수정하시오*/
update SummerPrice
set price=15000
where class='FORTRAN';

select price "FORTRAN 수강료"
from SummerPrice
where class='FORTRAN';

select *
from SummerPrice;