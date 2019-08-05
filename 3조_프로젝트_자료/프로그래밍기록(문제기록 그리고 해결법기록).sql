추가된 sql문 & 수정사항 기록

<19.08.04 기록> 

1. USERT에서 컬럼명이 '이름'으로 되어있었음 => name으로 수정.<<<<해결>>>>
2. 원래 아이디와 이메일을 따로 구분하여 했었는데, 둘을 같은 것으로 보기로 했음. =>email속성 삭제.
	=>회원가입 폼 수정. 자바스크립트 email 유효성검사 삭제
	=>회원가입 때 아이디 검사 과정 수정해야함...ID유효성 검사 정규식 수정했음.
	=>비밀번호 정규식 수정.
	
3. 각 테이블에 대한 DAO 와 RowMapper 추가했음.<<<<해결>>>>
	=>PostVO 삭제하고 PostingVO로 교체했음. 이유는 USER 테이블과 POST테이블의 JOIN의 결과 중 
	  게시판에서 보여줄 필요한 컬럼들의 데이터를 담아줄 VO가 필요했기때문...그냥 PostVO는 
	  단지 POST 테이블의 데이터만 가지고 있었음.
	  
4. 닉네임도 정규식을 적용하자.<<<<해결>>>> 
	- 이유는 너무 길게 써서 닉네임 데이터 크기를 벗어나는 경우를 방지하기 위해서.
5. '뒤로가기' 
	- 회원가입하고 다음페이지 넘어간 후 뒤로가기눌렀을 때 회원가입 페이지 어떻게할지
	- 로그인하고 메인페이지로 넘어간 후 다시 뒤로 갔을 때 로그인하는 페이지가 나와야하는지 어떻게 하지?
	
6. 한글로 작성한 input 들 깨져서 들어감 => 수정은? <<<<해결>>>>
	- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	- <%request.setCharacterEncoding("UTF-8"); %>
	문장을 JSP 페이지 상단에 배치시켜주면 되더라.
	
7. 갑자기 생긴 또다른 문제... 왜 USERT에 아무 레코드도 없는데 회원가입할 때 아이디 중복검사에서
   이미 있는 아이디라고 나오는거지..?<<<<해결>>>>
   
8. 아이디 중복검사 시에도 아이도 유효성검사 과정을 추가해줘야함 .<<<<해결>>>>
	=> 데이터베이스 COMMIT을 안해줘서 데이터 select시 안보이는거때매 시간잡아먹었음...



<추가 sql문>
--시퀀스 조회(만들었나 안만들었나 기억이안나서...)
select * from user_sequences;
--필요없는 시퀀스 삭제
drop sequence seq_payrecordno;
drop sequence seq_contentno;
--필요한 시퀀스 추가
create sequence seq_postno;
create sequence seq_commentno;
create sequence seq_payno;
