과제1 - 비디오 가게 ERD를 보고 물리 데이터 모델링하기 

CREATE TABLE Member (
	phone CHAR(13) NOT  NULL,
	saving INT NOT NULL DEFAULT 0
);

CREATE TABLE Rented (--대여기록
	rented_serialNo INT NOT NULL,
	phone CHAR(13) NOT NULL,
	item_serialNo INT NOT NULL,
	lateFee INT NOT NULL,
	returnDay CHAR(10) NOT NULL
);

CREATE TABLE Movie (
	ISBN CHAR(13) NOT NULL,
	genre CHAR(10) NOT NULL,
	mainPerson CHAR(10) NOT NULL,
	fee INT NOT NULL
);

CREATE TABLE Item (
	item_serialNo INT NOT NULL,
	now_rented BOOL NOT NULL DEFAULT FALSE
);

CREATE TABLE Reservation (--예약 관계 테이블, 회원과 영화의 다대다 관계
	phone CHAR(13) NOT NULL,
	ISBN CHAR(13) NOT NULL,
	bookdate DATE NOT NULL
);

CREATE TABLE rent_ing (

);
