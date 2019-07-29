show databases;
-- 먼저 database 만들고 , 그 안에 테이블을 만든다.

create database study;--데이터베이스 만들기

use study;--그 데이터베이스를 사용하기

create table study01t (-- 그 안에 테이블 만들기
	id 	  INT     not null,
	score TINYINT not null
);

insert into study01t values (10101,100);
insert into study01t values (10102,90);

select * from study01t;

insert into study01t values (10103,80);

--입력시 순서를 바꾸어서 입력할 수도 있다

insert into study01t (score,id) values (70,10104);

--테이블에 있어야 하는 개념
--1. 필드 – 컬럼
--- 자료형을 지정한다. (int(4), tinyint(1))
--- 같은 자료형의, 같은 의미의 값이 와야 한다.

--2. 레코드, - row
--- 입력의 단위
--- 데이터들이 연관되어진 묶음이어야 한다.

--“이 두 가지 개념이 있어야 테이블이라 할 수 있다.”

delete from study01t where id = 10101;
-- where 조건을 만족하는 레코드를 없앤다.

--다 지우기
delete from study01t;

--가끔 잘 써먹는 데이터 지우기 방법
delete from study01t where 0 = 1;--하나도 안지우기
delete from study01t where 1 = 1;--다 지우기

                        [동작 부분]             [조건 필터]
update study01t set    score = 110          where id = 10101;
update study01t set    score = score – 10   where id = 10101;--기존 값 활용
update study01t set    score = id – 10000   where id = 10101;--같은 레코드 값 활용
update study01t set    score = id – 10000   where id != 10101;
update study01t set    id = 0, score = 0     where id = 10101;

--특정 필드만 보여줄 때
select id from study01t where id !=10101;
select score, id from study01t where id != 10101; -- 필드 순서 섞어서도 가능
select score + 5, id from study01t where id != 10101;--원래 테이블에 가공된 형태로 볼 수 있다.

select score + 5 as sungjuk, id from study01t where id != 10101;--컬렴명 다르게 가공해서 볼수 있다. 실제로 바뀐 것은 아님!

select score, score as sungjuk from study01t;--하나의 필드를 여러 번 출력도 가능하다




create table study02t(
	id char(5) not null,
	name varchar(10) null
);

insert into study02t values ('0001','lll');--varchar라서 원래 수용가능한 크기보다 짧은 길이만큼 딱 그 만큼만 씀.
insert into study02t values ('a0001', 'HelloworldXXX');--대신 10자리 넘어가면 안 들어가짐
insert into study02t values ('a0001', 'Helloworld');
insert into study02t values ('a01', 'apple');--5자채워야 하는데 3이라서 뒤에 2개 남음

select concat(id, '*') from study02t;
--oracle : 'a01 *'

--문자열 : ‘’로 감싼다. char or  varchar 자료형
--char : 고정길이 문자열( 학번 주민번호 ...)

-- 무조건 고정길이 : 처리 속도가 훨씬 빠름.
--‘a01’을 넣어도 무조건 5자리 차리 (낭비 각오)
--varchar 은 가변길이 : 
--‘apple’을 넣으면 5자리만 공간 사용, 낭비 적다.
--varchar 와 char는 최대 길이 넘겨서 넣을 수 없다.


--Q. 역삼동에 사는 학생은?

select * from studentt where addr LIKE '역%';
select * from studentt where addr LIKE '%삼동';

select * from studentt where addr LIKE '%포%';

select addr from studentt;
select substr(addr,1,2) from studentt; -- 부분 문자열 추출하여 결과로 ~ 

select * from studentt where substr(addr, 1, 2) = '역삼';

select length(addr) from studentt;
--글자 길이 . utf-8 인 경우는 한글은 3바이트

--** aggregate functions : 5가지
--min max count avg sum;  ==> 유일한 결과를 출력하는 성격이 있다...!!

select * from scoret where subid = 'KOR1';
select min(score) from scoret where subid = 'KOR1';
select max(score) from scoret where subid = 'KOR1';
select count(score) from scoret where subid = 'KOR1';
select avg(score) from scoret where subid = 'KOR1';
select sum(score) from scoret where subid = 'KOR1';

--10101 학생의 평균 성적은?
select avg(score) from scoret where stid = 10101;

--국어에서 70점 이하 점수 받은 사람은?
select * from scoret;
select * from scoret where subId='KOR1'AND score <= 70;

--수학에서 60, 80 점 받은 학생은 ? (or 괄호 사용)
select * from scoret where subId='MAT1'AND (score=60 OR score=80);
select * from scoret where subId='MAT1'AND score in (60, 80);


select count(*) from scoret where subid = 'MAT1' and score in (80,60);

--studentt, subjectt, scoret 는 얽혀 있다.
--'여러 개의 테이블이 연관관계를 가지고 데이터베이스를 구성'

Q. 역삼동 학생들의 국어 성적은 ? 

select * from studentt where addr LIKE '역%';--서브쿼리 1
select * from scoret where subid = 'KOR1' and stid IN ('10101','10103');--서브쿼리 2
select * from scoret where subid = 'KOR1' and stid IN (select stid from studentt where addr LIKE '역%');--최종쿼리
--여러 개 나오는 결과를 이용할 때는 IN 또는 NOT IN 을 사용한다.
--하나의 쿼리의 결과를 이용해서 다른 쿼리를 돌릴 수 있다.
--이것을 서브쿼리 라고 한다.

Q. 국어에서 평균 이하의 점수를 받은 학생은 누구?
select stId from scoret where score <= (select avg(score) from scoret where subId='KOR1');--2 : 서브쿼리 2
select * from studentt where stid IN (select stId from scoret where score <= (select avg(score) from scoret where subId='KOR1'));--3 : 최종 쿼리                           
--유일한 서브쿼리 결과와 비교는 = != < <= > >= 을 쓴다. 서브쿼리는 반드시 괄호로 묶어 주어야 한다.

Q. 김씨성 가진 학생들의 수학 평균은 ?
select stid from studentt where name like '김%';
select avg(score) from scoret where subId='MAT1'AND stId IN (select stid from studentt where name like'김%');

Q. 영어에서 70점 이하의 점수를 받은 학생들의 성적을 -5점하라.
select stid from scoret where subId='ENG1' AND score <=70;
update scoret set score = score - 5 where subId = 'ENG1' AND stid IN (select stid from scoret where subId='ENG1' AND score <=70);
update scoret set score = score - 5 where subId = 'ENG1' AND stid IN (select * from (select stid from scoret where subId='ENG1' AND score <=70) AS X);

Q. 영어에서 70점 이하의 점수를 받은 학생들의 성적을 +5점하라.
update scoret set score = score + 5 where subId = 'ENG1' AND stid IN (select * from (select stid from scoret where subId='ENG1' AND score <=70) AS X);


--"AGGREGATE FUNCTION은 GROUP BY , HAVING 과 연동된다."

select avg(score) from scoret group by stId;--학번별로 평균점수를 알아내기 : stid에 동일한 값을 가진 레코드를 짜매어서 평균낸 결과.
select stid, avg(score) from scoret group by stId;--셀렉트절에 그룹바이에 적용한 컬럼의 값만 올수있다. stid가 그렇다.
--group by 를 썼을 때는 group by에 지정된 컬럼만 select절에 와야한다.

--평균 75 이하의 학생?
select stid, avg(score) from scoret group by stId where avg(score) <=75;--오류가 남... where 절이 제일 먼저 처리되고 나서 group by절이 실행되기때문에 아직 나오지도 않은 값을 가지고 비교를 하려고 하니 안됨! where는 통계처리에 우선한다.
--해서! having을 이용해주면 됨!!! 통계처리 이후에 동작한다.
select stid, avg(score) from scoret group by stId having avg(score) <=75;-

--서브쿼리는 크게 3종류로 나뉜다. 
--1. where 절의 서브쿼리
--2. from 절의 서브쿼리 = inline view
--3. select 절의 서프쿼리 (엄청난 결과/ 엄청난 부담)

--from 절의 서브쿼리 : select 결과를 마치 table 처럼 보면 된다
select stid, round( avg(score), 3 ) as xx from scoret group by stid;
-- 될것 같은데 이게 안되나? (from 절 서브쿼리는 데이터베이스 마다 지원 안하기도 한다.) => AS X 붙여주면 됨...
select * from (select stid, round( avg(score), 3 ) as X from scoret group by stid) AS XX where X <=75;

--view는 실제로 데이터가 존재하는 테이블이 아니라 테이블 데이터를 이용해서 만들어진 하나의 결과화면일 뿐이다.
--view를 대상으로 수정삭제는 무의미하다.
create view score2v as select stid, round(avg(score), 2 ) as xx from scoret group by stid;
select * from score2v;

----start
select stid, name from student;
select stid, name, (select avg(score) from scoret) as avg from studentt;--레코드 하나마다 서브쿼리 문장도 돌아가야 한다. 
select stid, name, (select avg(score) from scoret where stid = '10101') as avg from studentt);

--원래는 테이블명.컬럼명 식으로 쓰는게 맞았다  (우리는 생략)
select studentt.stid, studentt.name from studentt;--==> 긴 컬럼명을 짧게 as 로 지정가능!
select x.stid, x.name from studentt as x;
-----end
----start
select x.stid, x.avg from (
select stid, avg(score) as avg from scoret group by stid) as x;

create table temp01t as 
	select stid, avg(score) as avg from scoret group by stid;
create view temp01v as 
	select stid, avg(score) as avg from scoret group by stid;	
update scoret set score = 100 where stid = '10101';
select * from temp01t;--속도 빠름 반면, 생성 이후의 데이터는 반영이 안 된다.
select * from temp01v;--오버헤드 있음, 다만, 최신 데이터 반영이 된다. 
drop table temp01t


--등수 구하기 
1. select x.stid , x.avg from temp01t as x;

2.select x.stid , x.avg, 
	( select count(*) + 1 from temp01t where avg > x.avg)
	as rank
	from temp01t as x;
	
3.create table temp02t as --임시테이블을 사용하므로써 오버에드를 확 줄일 수 있음 엄청나게 많은 조회를 요할때 이렇게 사용하자.
	select x.stid , x.avg, 
	( select count(*) + 1 from temp01t where avg > x.avg)
	as rank
	from temp01t as x;
	
	select * from temp02t order by rank; --일등부터 위에서 아래
	select * from temp02t order by rank desc; --꼴찌부터 위에서 아래
	--임시테이블과 뷰는 흩어진 데이터에서 자산이 원하는 데이터로 가공할 수 있는 방법을 제공한다.
	--(비정형 데이터에서 정형화된 데이터를 만들어 낸다.)
	
	--뷰는 오버헤드가 있지만 데이터의 변경을 즉각 반영한다.
	--임시테이블은 오버헤이드가 적지만 데이터의 변경을 즉각 반영 못함.
	
	--select 서브쿼리는 오버헤드가 크다.
	--(1000명의 등수를 처리한 결과를 1000명이 동시에 열람하면 100만건의 쿼리가 동작하는 셈 + group by 오버헤드도 포함)
	--그런데 이것을 임시테이블이란 것을 이용해 부담을 극적으로 줄여준다.(도사들은 이걸 기가 막히게 잘 쓴다.)
-----end
----start
create table study3t(
	no int not null auto_increment primary key,--auto_increment primary key : 일련번호 넣을 때! mysql에서만 쓰이는 법, 오라클은 squence를 이용.
	theTime datetime not null
);
insert into study3t values (default,now());--now()현재시간을 리턴. datetime 자료형에 쓰임.
--datatime 자료형에 들어있는 값은 연산이 가능하다.
select no, date_add(theTime, INTERVAL 1 MONTH) from study3t;--1달 뒤에
select no, date_add(theTime, INTERVAL 10 DAY) from study3t; --10일 뒤에
-- 날짜 데이터를 다룰 때 연산의 필요성이 없으면 char 쓴다. 연산을 안하기에 처리속도가 빠르기 때문에 고려해서 해준다.
create table study4t (
	no int not null auto_increment primary key ,
	theTime char(19) not null
);
insert into study4t values (default,now());

---------------------------------------------------------------------------------------------------

2일차
----START
select stid, name, (kor1 + mat1 + eng1) / 3 as avg from score2t;
--score2t는 과목이 늘거나 줄 때에 대책이 심각하다. 새로 만들어야 할것이다.
--그러나 평균을 구하는 동작속도는 무지하게 빠르다. 서브쿼리도 없고 그룹바이하는것도 없고 그렇다.
--score2t과 같이 설계된 테이블은 비정규화된 테이블이라고 한다. 

--정규화 : less column (테이블당 필드의 갯수가 적다 - 5 ~ 12개) 
--More Table(score2t가 한 개로 되는 걸 우리는 3개를 만들었다...)
--필드와 데이터의 중복저장을 허용 안 한다.(비디오점의 대여여부)

--비정규화 : more column, less table
--필드와 데이터의 중복저장을 허용 한다. (속도 때문에)

--정답이 없지만 "대부분 정규화를 기본으로 해서 적절한 비정규화를 도입한다."

create table student_xt as
	select stid, name, addr from score2t where 0=1;--테이블은 있는데 안에 데이터 X, 껍데기만 만드는 것
	
insert into student_xt
	select stid,name, adrr from score2t where 1=1;--테이블에 select 결과를 입력하는 것
	
Q. subject1_xt, score_xt를 만들고 , 기존의 데이터를 배치하자.

create table subject1_xt as
	select kor1, eng1, mat1 from score2t where 0=1;
	
insert into subject1_xt
	select kor1, eng1, mat1 from score2t where 1=1;
	
create table score_xt as
	select stid, 'KOR1' as subid, kor1 as score from score2t where 0=1;
	
insert into score_xt
	select stid, 'KOR1', kor1 as score from score2t where 1=1;
	
insert into score_xt
	select stid, 'MAT1', mat1 as score from score2t where 1=1;

insert into score_xt
	select stid, 'ENG1', eng1 as score from score2t where 1=1;
	
--비정규화 된 설계에서 정규화된 설계로 옮길 수도 있고
--정규화된 설계에서 비정규화된 설계로 옮길 수도 있어야 한다.
----END


----START
--JOIN : 서브쿼리와 유사한데, 서브쿼리와 좀 다르다!
--studentt의 stid(PK) <- scoret의 stid(FK)
--대부분의 JOIN은 PK - FK 사이에서 일어난다.

select * from studentt INNER JOIN scoret ON studentt.stid = scoret.stid;(mysql)
select * from studentt , scoret where studentt.stid = scoret.stid;(Oracle)
--INNER JOIN : PK - FK 데이터가 일치하는 레코드를 짜매준다.

select name, addr, score from studentt INNER JOIN scoret ON studentt.stId = scoret.stId WHERE subid = 'MAT1';
--JOIN을 이용하면 흩어진 데이터를 통합해서 보여지게 할 수 있다.
--(서브쿼리도 가능. 헌데 성능이 틀리다. 해서 같은 결과를 만들되 성능이 향상되게 만드는 것이 SQL 튜닝의 영역)

Q. subjectt 과 scoret 를 inner join해서 10101 국어 90 ... 의 형태로 출력되도록 해라
select stid, name, score from subjectt INNER JOIN scoret ON subjectt.subId = scoret.subId;
----END

----START
select stid, avg(score) as avg FROM scoret group by stid;

select * from (select stid, avg(score) as avg FROM scoret group by stid) AS x;

select * from (select stid, avg(score) as avg FROM scoret group by stid) AS x INNER JOIN studentt as y ON y.stId = x.stId;

select y.stid, name, avg from (select stid, avg(score) as avg FROM scoret group by stid) AS x INNER JOIN studentt as y ON y.stId = x.stId;
----END

----START
OUTER JOIN 외부조인;

select * from subjectt INNER JOIN scoret ON subjectt.subId = scoret.subid;

INSERT INTO subjectt values ('PHY1','물리');--과목으로 새로운 것이 들어왔다. 아직 이 과목을 시험 본 사람이 없기에 scoret에 관련 데이터가 없다.
--그리고 바로 위 쿼리를 날려 확인해도 당연히 달라지는게 없다. 근데 물리의 데이터는 보고 싶다면 ?

--물리가 추가 됐어도 한건의 성적 데이터가 없으니 짜매어줄 대상이 없다. 회원가입이 되어도 글 쓴게 없으면
--조인 걸어도 나타나지 않는다. 이런 식으로 한 쪽 테이블에서만 보여지고 짜매지지 않는 경우라도
--한건 보여지게 만드는 형태의 조인이 OUTER JOIN이다.
select * from subjectt LEFT OUTER JOIN scoret ON subjectt.subId = scoret.subid;
--부족함이 나타나는 반대편을 명시한다.

--아래 쿼리는 과목별로 수강데이터의 갯수를 센다. count(*)는 레코드의 갯수를 세고, count(필드)는 null은 제외하고 계산
select subjectt.subid , count(*) from subjectt LEFT OUTER JOIN scoret ON subjectt.subid = scoret.subid GROUP BY subjectt.subid;
----END

----START
CONSTRAINT : 물리적인 제약조건을 필드(들)에 걸어준다. 
score : 0 ~ 100 사이의 값만 허용해야한다.
--밑에 쿼리는 아에 못들어가게 막아야한다.
insert into scoret values ('10101','PHY1',120);

ALTER TAbLE scoret ADD CONSTRAINT CHeck_scoret_score CHECK(score > 0 AND score<100);
--ARTER Table (테이블 수정) ADD CONSTRAINT (제약조간 추가)
--제약조검은 CHECK, UNIqUE, primaly key, foreign key 4가지를 쓴다.
--지울 때는 ARTER TABLE scoret DROP CONSTRAINT CHECK_scoret_score;
--CHECK CONSTRAINT 는 WHERE절의 조건을 이용하여 제약을 걸 수 있다.
--(IN, NOT IN, = != ...을 사용할 수 있다.)

ALTER TABLE subjectt ADD CONSTRAINT PK_subjectt_subid PRIMARY KEY (subid);
--NOT NULL, NO DUPLICATE를 물리적으로 보장한다.
--테이블당 하나의 PK constraint 사용가능.

--참조무결성 : PK쪽에서 쓰여진 데이터만 FK 쪽에 쓰여질 수 있다.
	-- 회원가입 해야 글 쓴다.
	-- 회원 등록 해야 예약한다.
	-- 등록된 아이템만 대여가능하다.
	
--UNIQUE CONSTRAINT : NULL 허용하는데 중복은 안된다.
--(테이블 분리할 때 절묘하게 쓰인다..) 엔티티 사이에서 일대다의 관계가 있을 때 원래는 다 쪽으로 관게 속성이 붙어 들어가지만 필드가 너무 많아 지면
--좀 그럴수 있어서 마치 다대다 관계에서 따로 테이블을 만드는 것과 같이 양쪽 엔티티에서 기본키를 가져와서 
--테이블을 만들고 거기서 PK중 하나에 중복이 안되도록 UNIQUE를 걸면 다대다 테이블에서 일대다의 효과를 나타낼 수 있다고 한다.

--CONSTRAINT 지울 때
--ALTER TABLE study5t DROP CONSTRAINT UNIQUE UQ_Study5t_id;