과제1 - 비디오 가게 ERD를 보고 물리 데이터 모델링하기 
--CREATE TABLE 구간
CREATE TABLE Membert (
	phone CHAR(13) NOT  NULL,
	saving INT NOT NULL DEFAULT 0
);

CREATE TABLE Moviet (
	ISBN CHAR(13) NOT NULL,
	genre CHAR(10) NOT NULL,
	mainPerson CHAR(10) NOT NULL,
	fee INT NOT NULL
);

CREATE TABLE Itemt (
	item_serialNo INT NOT NULL,
	now_rented BOOL NOT NULL DEFAULT FALSE
);

CREATE TABLE Reservationt (--예약 관계 테이블, 회원과 영화의 다대다 관계
	phone CHAR(13) NOT NULL,
	ISBN CHAR(13) NOT NULL,
	bookdate DATE NOT NULL
);

CREATE TABLE rent_ingt (
	phone CHAR(13) NOT NULL,--foreign key
	item_serialNo INT NOT NULL,--foreign key
	borrow_date CHAR(10) NOT NULL,--빌린 날
);

CREATE TABLE Recordt (--대여기록
	record_serialNo INT NOT NULL,--일련번호
	phone CHAR(13) NOT NULL,--foreign key
	item_serialNo INT NOT NULL,--foreign key
	borrow_date CHAR(10) NOT NULL,--빌린 날
	return_date CHAR(10),--반납한 날
	rentalFee INT NOT NULL,
	lateFee INT DEFAULT 0,--연체료
	totalGetMoney INT
);
--CREATE TABLE 구간
--CONSTRAINT 구간

ALTER TABLE member ADD CONSTRAINT PK_member PRIMARY KEY(phone);

ALTER TABLE 


--CONSTRAINT 구간