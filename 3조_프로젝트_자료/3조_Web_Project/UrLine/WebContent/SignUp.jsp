<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Line 회원가입</title>


<style>
h, td, tr, input, textarea, select, FORM {
	font-family: 고딕;
	font-size: 1em;
	border-radius: 5px;
}

table, FORM {
	border: 1px solid rgba(36, 228, 172, 0.29);
	border-spacing: 15px;
}
</style>

<script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if(!document.userInfo.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            if(!document.userInfo.name.value){
                alert("이름을 입력해주세요.");
                return false;
            }
            
            if(!document.userInfo.pw.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.userInfo.pw.value != document.userInfo.rePw.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
            
            
            if(!document.userInfo.emailId.value){
                alert("이메일 아이디를 입력해주세요.");
                return false;
            }
            if(!document.userInfo.emailDomain.value){
                alert("이메일 도메인을 입력해주세요.");
                return false;
            }
            
            if(!document.userInfo.emailDomain.value){
                alert("이메일 도메인을 입력해주세요.");
                return false;
            }
            
        }
     	// 취소 버튼 클릭시 로그인 화면으로 이동
        function goLoginForm() {
            location.href="Login.jsp";
        }
</script>


</head>
<body style="background-color: #f0f5f3">

	<center>
		<h1>회원가입</h1>
		<table boder="" bgcolor="#cdfdee" cellspacing="1">
			<FORM method="POST" action="SignUp_process2.jsp" name="userInfo" onsubmit="return checkValue()">
				<tr>
					<td text-align="center">아이디</td>
					<td><input type="text" name="id" /> 
						<input type="button" value="중복확인" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" /></td>
				</tr>

				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="rePw" />&nbsp;*비밀번호를 다시 입력하시길 바랍니다.</td>
				</tr>

				<tr>
					<td>성명</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="nickName" /></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>남<input type="radio" name="sex" value = "1" checked = "checked"/>
						여<input	type="radio" name="sex" value = "2"/>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="emailId" /> @ 
						<input type="text" name="emailDomain"/>
						&nbsp;&nbsp; 
						<select>
							<option>직접입력</option>
							<option>naver.com</option>
							<option>daum.net</option>
							<option>nate.com</option>
						</select>
					</td>
				</tr>

				<tr>
					<td>휴대폰</td>
					<td> 
						<input type="text" size="2" name="phone1" va/> -
						<input type="text" size="2" name="phone2"/> - 
						<input type="text" size="2" name="phone3"/>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<input type="submit" value="가입하기" /> 
						<input type="button" value="취소" onclick="goLoginForm()">
						<input type="reset" value="다시입력" />
					</td>
				</tr>
			</FORM>
		</table>



	</center>
</body>
</html>