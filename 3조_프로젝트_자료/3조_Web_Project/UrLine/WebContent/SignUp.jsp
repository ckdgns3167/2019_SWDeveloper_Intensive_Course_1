<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Line ȸ������</title>


<style>
h, td, tr, input, textarea, select, FORM {
	font-family: ���;
	font-size: 1em;
	border-radius: 5px;
}

table, FORM {
	border: 1px solid rgba(36, 228, 172, 0.29);
	border-spacing: 15px;
}
</style>

<script type="text/javascript">
    
        // �ʼ� �Է������� ���̵�, ��й�ȣ�� �ԷµǾ����� Ȯ���ϴ� �Լ�
        function checkValue()
        {
            if(!document.userInfo.id.value){
                alert("���̵� �Է��ϼ���.");
                return false;
            }
            if(!document.userInfo.name.value){
                alert("�̸��� �Է����ּ���.");
                return false;
            }
            
            if(!document.userInfo.pw.value){
                alert("��й�ȣ�� �Է��ϼ���.");
                return false;
            }
            
            // ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
            if(document.userInfo.pw.value != document.userInfo.rePw.value ){
                alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
                return false;
            }
            
            
            if(!document.userInfo.emailId.value){
                alert("�̸��� ���̵� �Է����ּ���.");
                return false;
            }
            if(!document.userInfo.emailDomain.value){
                alert("�̸��� �������� �Է����ּ���.");
                return false;
            }
            
            if(!document.userInfo.emailDomain.value){
                alert("�̸��� �������� �Է����ּ���.");
                return false;
            }
            
        }
     	// ��� ��ư Ŭ���� �α��� ȭ������ �̵�
        function goLoginForm() {
            location.href="Login.jsp";
        }
</script>


</head>
<body style="background-color: #f0f5f3">

	<center>
		<h1>ȸ������</h1>
		<table boder="" bgcolor="#cdfdee" cellspacing="1">
			<FORM method="POST" action="SignUp_process2.jsp" name="userInfo" onsubmit="return checkValue()">
				<tr>
					<td text-align="center">���̵�</td>
					<td><input type="text" name="id" /> 
						<input type="button" value="�ߺ�Ȯ��" /></td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input type="password" name="pw" /></td>
				</tr>

				<tr>
					<td>��й�ȣ Ȯ��</td>
					<td><input type="password" name="rePw" />&nbsp;*��й�ȣ�� �ٽ� �Է��Ͻñ� �ٶ��ϴ�.</td>
				</tr>

				<tr>
					<td>����</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>�г���</td>
					<td><input type="text" name="nickName" /></td>
				</tr>
				<tr>
					<td>����</td>
					<td>��<input type="radio" name="sex" value = "1" checked = "checked"/>
						��<input	type="radio" name="sex" value = "2"/>
					</td>
				</tr>
				<tr>
					<td>�̸���</td>
					<td><input type="text" name="emailId" /> @ 
						<input type="text" name="emailDomain"/>
						&nbsp;&nbsp; 
						<select>
							<option>�����Է�</option>
							<option>naver.com</option>
							<option>daum.net</option>
							<option>nate.com</option>
						</select>
					</td>
				</tr>

				<tr>
					<td>�޴���</td>
					<td> 
						<input type="text" size="2" name="phone1" va/> -
						<input type="text" size="2" name="phone2"/> - 
						<input type="text" size="2" name="phone3"/>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<input type="submit" value="�����ϱ�" /> 
						<input type="button" value="���" onclick="goLoginForm()">
						<input type="reset" value="�ٽ��Է�" />
					</td>
				</tr>
			</FORM>
		</table>



	</center>
</body>
</html>