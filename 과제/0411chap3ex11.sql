/*99페이지 1번 문제 테이블구조와 데이터*/

CREATE TABLE 극장 (
  극장번호 int primary key,
  극장이름 VARCHAR(50) NOT NULL,
  위치 VARCHAR(50) NOT NULL
);

INSERT INTO 극장 (극장번호, 극장이름, 위치)
values (1, '롯데', '잠실');
INSERT INTO 극장 (극장번호, 극장이름, 위치)
values (2, '메가', '강남');
INSERT INTO 극장 (극장번호, 극장이름, 위치)
values (3, '대한', '잠실');

CREATE TABLE 상영관 (
극장번호 int,
상영관번호 int,
영화제목 VARCHAR(50) NOT NULL,
가격 int NOT NULL,
좌석수 int NOT NULL,
PRIMARY KEY (극장번호, 상영관번호)
);

INSERT INTO 상영관 (극장번호, 상영관번호, 영화제목, 가격, 좌석수)
values (1, 1, '어려운영화', 15000, 48);
INSERT INTO 상영관 (극장번호, 상영관번호, 영화제목, 가격, 좌석수)
values (3, 1, '멋진영화', 7500, 120);
INSERT INTO 상영관 (극장번호, 상영관번호, 영화제목, 가격, 좌석수)
values (3, 2, '재밌는 영화', 8000, 110);

CREATE TABLE 예약 (
극장번호 int,
상영관번호 int,
고객번호 int,
좌석번호 int,
날짜 date,
primary key (극장번호, 상영관번호, 좌석번호, 날짜)
);

INSERT INTO 예약 (극장번호, 상영관번호, 고객번호, 좌석번호, 날짜)
values (3, 2, 3, 15, '2020-09-01');
INSERT INTO 예약 (극장번호, 상영관번호, 고객번호, 좌석번호, 날짜)
values (3, 1, 4, 16, '2020-09-01');
INSERT INTO 예약 (극장번호, 상영관번호, 고객번호, 좌석번호, 날짜)
values (1, 1, 9, 48, '2020-09-01');

CREATE TABLE 고객 (
고객번호 int primary key,
이름 VARCHAR(50) NOT NULL,
주소 VARCHAR(100) NOT NULL
);

INSERT INTO 고객 (고객번호, 이름, 주소)
values (3, '홍길동', '강남');
INSERT INTO 고객 (고객번호, 이름, 주소)
values (4, '김철수', '잠실');
INSERT INTO 고객 (고객번호, 이름, 주소)
values (9, '박영희', '강남');




    
/*SELECT * FROM 극장;
SELECT * FROM 상영관;
SELECT * FROM 예약;
SELECT * FROM 고객; */

/*제약 조건 - 영화 가격은 20,000원을 넘지 않아야한다
            상영관번호는 1부터 10사이이다.
            같은 사람이 같은 좌석번호를 두 번 예약하지 않아야 한다.*/
            
            
            
/*(1) 단순질의*/

/*모든 극장의 이름과 위치를 보이시오.*/
select * from 극장;

/*'잠실에 있는 극장을 보이시오.'*/
select * from 극장
where 위치 = '잠실';

/*잠실*에 사는 고객의 이름을 오름차순으로 보이시오*/

select * from 고객
where 주소 = '잠실'
ORDER BY 이름 ASC;

/*가격이 8,000원 이하인 영화의 극장번호, 상영관번호, 영화제목을 보이시오.*/
select * from 상영관
where 가격 <= 8000;

/*극장 위치와 고객의 주소가 같은 고객을 보이시오.*/
select *
from 극장, 고객
where 극장.위치 = 고객.주소;



/*(2) 집계질의 */

/*극장의 수는 몇 개인가?*/
select count(*) as 극장수 
from 극장;

/*상영되는 영화의 평균 가격은 얼마인가?*/
select avg(가격) as 평균가격 
from 상영관;

/*2020년 9월 1일에 영화를 관람한 고객의 수는 얼마인가?*/
select count(distinct 고객번호)
from 예약
where 날짜 = '2020-09-01';



/*(3) 부속질의와 조인*/

/*'대한' 극장에서 상영된 영화제목을 보이시오.*/
select 영화제목 
from 상영관 
where 극장번호 = 3;

/*'대한' 극장에서 영화를 본 고객의 이름을 보이시오.*/
select distinct 고객.이름
from 예약
join 극장 on 예약.극장번호 = 극장.극장번호
join 고객 on 예약.고객번호 = 고객.고객번호
where 극장.극장이름 = '대한';

/*'대한'극장의 전체 수입을 보이시오.*/
select sum(가격*좌석수) as 전체수입
from 상영관 s
join 예약 r
on s.극장번호 = r.극장번호 AND s.상영관번호 = r.상영관번호
where s.극장번호 = 3;



/*(4) 그룹질의*/

/*극장별 상영관 수를 보이시오.*/
select 극장이름, count(*) as 상영관수
from 상영관
join 극장 on 상영관.극장번호 = 극장.극장번호
group by 극장이름;

/*'잠실'에 있는 극장의 상영관을 보이시오.*/
select *
from 상영관
join 극장 on 상영관.극장번호 = 극장.극장번호
where 극장.위치 = '잠실';


/*2020년 9월 1일의 극장별 평균 관람 고객 수를 보이시오.*/
SELECT 극장.극장이름, AVG(상영관.좌석수 - COUNT(예약.좌석번호)) AS 평균_관람_고객_수
FROM 극장
JOIN 상영관 ON 극장.극장번호 = 상영관.극장번호
JOIN 예약 ON 상영관.극장번호 = 예약.극장번호 AND 상영관.상영관번호 = 예약.상영관번호
WHERE 예약.날짜 = '2020-09-01'
GROUP BY 극장.극장이름;

/*2020년 9월 1일에 가장 많은 고객이 관람한 영화를 보이시오.*/
SELECT 상영관.영화제목, COUNT(*) AS 관람고객수
FROM 예약
JOIN 상영관 ON 예약.극장번호 = 상영관.극장번호 AND 예약.상영관번호 = 상영관.상영관번호
WHERE 날짜 = '2020-09-01'
GROUP BY 상영관.영화제목
ORDER BY 관람고객수 DESC
FETCH FIRST 1 ROWS ONLY;
