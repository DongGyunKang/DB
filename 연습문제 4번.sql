drop table newBook CASCADE CONSTRAINTSCASCADE CONSTRAINTS;
drop table newcustomer CASCADE CONSTRAINTS;

/*Newbook table 생성*/
create table newBook(
bookid number primary key,
bookname varchar2(20) not null,
publisher varchar2(20) unique,
price number default 10000 check(price>1000));

select * from newbook;

/*newcustomer table 생성*/
create table newcustomer(
custid number primary key,
name varchar(20),
address varchar2(20),
phone varchar2(30));

/*새로운 도서 ('스포츠 세계', '대한미디어', 10000원)이 마당서점에 입고되었다. 
삽입이 안될 경우 필요한 데이터가 더 있는지 찾아보시오 */
alter table books add (title VARCHAR2(100), publisher VARCHAR2(50), price NUMBER);

insert into book (bookid, bookname, publisher, price) 
values (12, '스포츠 세계', '대한미디어', 10000);

select * from book;

/*'삼성당'에서 출판한 도서를 삭제하시오. */
delete from book 
where publisher = '삼성당';

select * from book;

/*'이상미디어에서 출판한 도서를 삭제하시오. 삭제가 안 되면 원인을 생각해보시오.'*/


/*출판사 '대한미디어'를 '대한출판사'로 이름을 바꾸시오.*/
update book
set publisher = '대한출판사'
where publisher = '대한미디어';

/*(테이블 생성) 출판사에 대한 정보를 저장하는 테이블 Bookcompany(name, address, begin)을 생성하고자 한다.
name은 기본키이며 VARCHAR(20), address는 VARCHAR(20), begin은 DATE 타입으로 선언하여 생성하시오.*/

create table Bookcompany (
    name VARCHAR(20) primary key,
    address VARCHAR(20),
    begin DATE
);

/*(테이블 수정)Boocompany 테이블에 인터넷 주소를 저장하는 webaddress 속성을
VARCHAR(30)으로 추가하시오.*/

alter table Boocompany
add webaddress VARCHAR(30);

/*Bookcompany 테이블에 임의의 투플 name=한빛아카데미, address=서울시 마포구,
begin=1993-01-01, wevaddress=http://hanbit.co.kr을 삽입하시오.*/

insert into Bookcompany (name, address, begin, webaddress)
VALUES ('한빛아카데미', '서울시 마포구', '1993-01-01', 'http://hanbit.co.kr');
