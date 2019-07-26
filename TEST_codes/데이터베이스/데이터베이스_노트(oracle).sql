create table study10t (
	id NUMBER(3),
	data VARCHAR2(10)
);
INSERT INTO study10t values (100,'HelloWorld');
============================================================
CREATE TABLE study11t(
	id NUMBER(5),
	data CHAR(10)
);
--오라클과 mysql은 일련번호를 만드는 법이 다르다.
--: mysql auto_increment primary key를 썼었다.
CREATE SEQUENCE seq_study11;
INSERT INTO study11t values ( seq_study11.NEXTVAL, 'apple');
=============================================================
--mysql 의 concat과 동일한 기능을 수행한다. 문자열 합치기, 문자열 연결하기 기능
--char(10) 으로 선언한 필드에 'apple'을 넣으면 'apple     '된다.
--하지만 mysql에서는 그냥 'apple'이 된다. 공백을 넣나 안넣나 mysql과 oracle의 차이가 있음.
select id , data || '*' from study11t;
--TRIM() : 좌/우의 공백문자를 제거하는 역할.
select id , TRIM(data) || '*' from study11t;
=============================================================
create table studt12t (
	the_time date
);
ALTER TABLE studt12t RENAME TO study12t;
insert into studt12t values (sysdate);
--oracle의 날짜시간은 date 자료형을 이용한다.
--현재 시간은 sysdate를 이용한다.
--보여지는 형식은 to_char()를 이용하여 형식을 지정하면 된다.
select to_char(the_time, 'YYYY-MM-DD') from studt12t;
=============================================================
CREATE TABLE StudentT(
	stId CHAR(5),
	name VARCHAR2(9),
	addr VARCHAR2(9)
);

INSERT INTO StudentT VALUES('10101','홍길동','역삼동');
INSERT INTO StudentT VALUES('10102','고길동','개포동');
INSERT INTO StudentT VALUES('10103','이기자','역삼동');
INSERT INTO StudentT VALUES('10104','박기자','한남동');
INSERT INTO StudentT VALUES('10105','김영삼','홍제동');
INSERT INTO StudentT VALUES('10106','김대중','한남동');
SELECT * FROM tabs;
SELECT * FROM USER_TABLES;
CREATE TABLE SubjectT(
	subId   CHAR(4), 
	name   VARCHAR2(9) 
);

INSERT INTO SubjectT VALUES ('KOR1','국어1');
INSERT INTO SubjectT VALUES ('ENG1','영어1');
INSERT INTO SubjectT VALUES ('MAT1','수학1');

CREATE TABLE ScoreT(
	stId  CHAR(5),
	subId CHAR(4), 
	score NUMBER(3)
);

INSERT INTO ScoreT VALUES('10101','KOR1',60);
INSERT INTO ScoreT VALUES('10101','ENG1',80);
INSERT INTO ScoreT VALUES('10101','MAT1',90);

INSERT INTO ScoreT VALUES('10102','KOR1',90);
INSERT INTO ScoreT VALUES('10102','MAT1',90);
INSERT INTO ScoreT VALUES('10102','ENG1',100);

INSERT INTO ScoreT VALUES('10103','KOR1',70);
INSERT INTO ScoreT VALUES('10104','KOR1',80);
INSERT INTO ScoreT VALUES('10105','KOR1',50);
INSERT INTO ScoreT VALUES('10106','KOR1',60);

INSERT INTO ScoreT VALUES('10103','ENG1',90);
INSERT INTO ScoreT VALUES('10104','ENG1',70);
INSERT INTO ScoreT VALUES('10105','ENG1',60);
INSERT INTO ScoreT VALUES('10106','ENG1',80);

INSERT INTO ScoreT VALUES('10103','MAT1',70);
INSERT INTO ScoreT VALUES('10104','MAT1',70);
INSERT INTO ScoreT VALUES('10105','MAT1',80);
INSERT INTO ScoreT VALUES('10106','MAT1',60);

CREATE TABLE Score2T (
	stId CHAR(5),
	name VARCHAR2(9),
	addr VARCHAR2(9),
	kor1 NUMBER(3),
	eng1 NUMBER(3),
	mat1 NUMBER(3)
);

INSERT INTO Score2T VALUES('10101','홍길동','역삼동',60,80,90);
INSERT INTO Score2T VALUES('10102','고길동','개포동',90,90,100);
INSERT INTO Score2T VALUES('10103','이기자','역삼동',70,90,70);
INSERT INTO Score2T VALUES('10104','박기자','한남동',80,70,70);
INSERT INTO Score2T VALUES('10105','김영삼','홍제동',50,60,80);
INSERT INTO Score2T VALUES('10106','김대중','한남동',60,80,60);

CREATE TABLE StudentT(
	stId CHAR(5),
	name VARCHAR2(9),
	addr VARCHAR2(9)
);

INSERT INTO StudentT VALUES('10101','홍길동','역삼동');
INSERT INTO StudentT VALUES('10102','고길동','개포동');
INSERT INTO StudentT VALUES('10103','이기자','역삼동');
INSERT INTO StudentT VALUES('10104','박기자','한남동');
INSERT INTO StudentT VALUES('10105','김영삼','홍제동');
INSERT INTO StudentT VALUES('10106','김대중','한남동');

CREATE TABLE SubjectT(
	subId   CHAR(4), 
	name   VARCHAR2(9) 
);

INSERT INTO SubjectT VALUES ('KOR1','국어1');
INSERT INTO SubjectT VALUES ('ENG1','영어1');
INSERT INTO SubjectT VALUES ('MAT1','수학1');

CREATE TABLE ScoreT(
	stId  CHAR(5),
	subId CHAR(4), 
	score NUMBER(3)
);

INSERT INTO ScoreT VALUES('10101','KOR1',60);
INSERT INTO ScoreT VALUES('10101','ENG1',80);
INSERT INTO ScoreT VALUES('10101','MAT1',90);

INSERT INTO ScoreT VALUES('10102','KOR1',90);
INSERT INTO ScoreT VALUES('10102','MAT1',90);
INSERT INTO ScoreT VALUES('10102','ENG1',100);

INSERT INTO ScoreT VALUES('10103','KOR1',70);
INSERT INTO ScoreT VALUES('10104','KOR1',80);
INSERT INTO ScoreT VALUES('10105','KOR1',50);
INSERT INTO ScoreT VALUES('10106','KOR1',60);

INSERT INTO ScoreT VALUES('10103','ENG1',90);
INSERT INTO ScoreT VALUES('10104','ENG1',70);
INSERT INTO ScoreT VALUES('10105','ENG1',60);
INSERT INTO ScoreT VALUES('10106','ENG1',80);

INSERT INTO ScoreT VALUES('10103','MAT1',70);
INSERT INTO ScoreT VALUES('10104','MAT1',70);
INSERT INTO ScoreT VALUES('10105','MAT1',80);
INSERT INTO ScoreT VALUES('10106','MAT1',60);

CREATE TABLE Score2T (
	stId CHAR(5),
	name VARCHAR2(9),
	addr VARCHAR2(9),
	kor1 NUMBER(3),
	eng1 NUMBER(3),
	mat1 NUMBER(3)
);
INSERT INTO Score2T VALUES('10101','홍길동','역삼동',60,80,90);
INSERT INTO Score2T VALUES('10102','고길동','개포동',90,90,100);
INSERT INTO Score2T VALUES('10103','이기자','역삼동',70,90,70);
INSERT INTO Score2T VALUES('10104','박기자','한남동',80,70,70);
INSERT INTO Score2T VALUES('10105','김영삼','홍제동',50,60,80);
INSERT INTO Score2T VALUES('10106','김대중','한남동',60,80,60);
==============================================================================================================
Q. 역삼동에 사는 학생의 국어성적을 서브쿼리로 구하세요.
select stid from studentt where addr LIKE '역%';--서브쿼리
select score from scoret where subid='KOR1' AND stid IN (select stid from studentt where addr LIKE '역%');

Q. 학생별 평균 점수를 group by로 구해보세요.
select stid, avg(score) from scoret group by stid;
=============================================================================================================
이너조인
select * from studentt inner join scoret on studentt.stid = scoret.stid;
select * from studentt, scoret where studentt.stid = scoret.stid;
=============================================================================================================
아우터조인
insert into subjectt values ( 'PHY1' , '물리');
select * from subjectt LEFT OUTER JOIN scoret ON subjectt.subid = scoret.subid;--부족한 쪽 반대에 LEFT
select * from subjectt, scoret where subjectt.subid = scoret.subid(+);--부족한 부분에 + 
=============================================================================================================
--INNER JOIN ON / OUTER JOIN ON : 국제표준 SQL, 각 DB 별로 변형 SQL을 탑재.
--Oracle 의 변형방법을 다른 DB업체들이 따라하기도한다.
--오라클만 쓰는 사람들은 오라클의 방법만을 고집하는 경우가 많다.
=============================================================================================================
오라클에서의 from에서의 서브쿼리 처리 
-- 테이블 별칭은 as 안쓴다. 컬럼 별칭은 쓴다.
-- mysql에서는 as 써줬어야 했다. 
select * from (select stid, avg(score) AS avg from scoret group by stid) x;
=============================================================================================================
select y.name, x.avg from (select stid, avg(score) AS avg from scoret group by stid) x , studentt y where x.stid = y.stid;
=============================================================================================================
as , join을 사용할 때 mysql과 문법이 약간 다르다. 하지만 기본 개념은 동일하다.
"거의 모든 데이터베이스의 기본 개념은 같다." 하나만 제대로 해놓으면 다른거 어렵지 않다.

Constraint int Oracle
- PRIMARY KEY, FOREIGN KEY , CHECK, UNIQUE, NOT NULL
alter table studentt add constraint pk_studentt_stid PRIMARY KEY (stid);
참조무결성 : FK 쪽에는 PK에 없는 데이터는 존재하면 안된다.
alter table scoret ADD constraint fk_scoret_stid FOREIGN KEY (stid) REFERENCES studentt (stid);
=============================================================================================================
delete from studentt where stid = '10101';
--> 안되는 이유 :
insert into scoret values ('10109','KOR1',100);
--> 안되는 이유 :
alter table scoret add constraint fk_scoret_subid foreign key (subid) references subjectt (subid);
--> 안되는 이유 : FK Constraint 는 먼저 참조할 대상 PK Constraint 가 존재해야 생성 가능하기 때문이다.
=============================================================================================================
alter table scoret add constraint ck_scoret_score check ( score >= 0 and score <= 100);
alter table scoret add constraint ck_scoret_score check ( score >= 0 and score <= 100 );
insert into scoret values('10101','PHY1',120);--안들어가는거 확인
alter table subjectt add constraint uq_subjectt_subid unique (subid);
--not null 은 보장안함 no duplicate 는 보장안함
insert into subjectt values (null,'없음0');
insert into subjectt values (null,'없음0');--null 값의 중복은 허용한다.

insert into subjectt values ('KOR1','없음0');--허용 안한다. 
--권장사항 : constraint는 테스트 끝나고서 alter로 걸어주는게 좋다 
--(회원가입 담당자가 일 다 안한 상황에서 게시판 담당자가 테스트 들어가려면? 이런 상황 때매 ....)
=============================================================================================================
constraint 지우기

alter table scoret drop constraint ck_scoret_score;
alter table subjectt drop constraint uq_subjectt_subid;
alter table scoret drop constraint fk_scoret_stid;
alter table studentt drop constraint pk_studentt_stid;
=============================================================================================================
--oracle
create table bangmyung_t (
	no NUMBER,
	gul varchar2(10),
	the_time date
);
create sequence seq_bangmyung;
insert into bangmyung_t values (seq_bangmyung.nextval, 'Hi',sysdate);
--mysql
create table bangmyong_t (
	no int auto_increment primary key,
	gul varchar(100),
	the_time datetime
);
insert into bangmyong_t values (default, 'Hi',now());
=============================================================================================================






































