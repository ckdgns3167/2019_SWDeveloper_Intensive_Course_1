<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ page import="dao.UserDAO" %>
<title>ID �ߺ�Ȯ��</title>
<%
	//�ѱ� ������ �����ϱ� ���� ���ڵ� ó��
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	UserDAO dao = UserDAO.getInstance();
	int check = dao.confrimId(id);
	
	if(check == -1){
%>
		<b><font color="red"><%=id%></font>�� �̹� ������� ���̵��Դϴ�.</b>
		<form name="checkForm" method="POST" action="ConfirmId.jsp">
			<b>�ٸ� ���̵� �Է����ּ���.</b><br /><br />
			<input type="text" name="id"/>
			<input type="submit" value="ID�ߺ�Ȯ��"/>
		</form>
<%
	} else {
%>
		<center>
			<b>�Է��Ͻ� <font color="red"><%=id%></font>��<br/>����Ͻ� �� �ִ� ID�Դϴ�. </b><br /><br />
			<input type="button" value="�����ϱ�" onclick="setid()">
		</center>
<%
	}
%>
<script language="javascript">
	function setid(){
		opener.document.userInfo.id.value="<%=id%>";
		opener.document.userInfo.confirm_id.disabled='disabled';
		opener.document.userInfo.confirm_id.value ="��밡��";
		opener.document.userInfo.id.disabled='disabled';
		self.close();
		//1. �ߺ�Ȯ�� ��ư ��Ȱ��ȭ ��Ű�� , id�Է¶� ��Ȱ��ȭ
		//2. �׸��� �Է°��� �� �Է��� ���� ���� + �ߺ��˻��ư ��Ȱ��ȭ�Ǹ� �����ϱ� ��ư Ȱ��ȭ�Ǳ�..!
		//3. �̸� �Է¶����� �ѱ��̸� 3���ڸ� �޵���, �г����� ����, �ڵ��� ��ȣ�� �� 11���̸鼭 �տ��� 010�� �޵���, �̸������� �Էµǵ���
		//		���̵�, ��й�ȣ�� 8�ڸ� �̻� , ���̵�� ����Ǵ¼��ڷθ�(ù���ڴ� ����ν���)
		
	}
</script>