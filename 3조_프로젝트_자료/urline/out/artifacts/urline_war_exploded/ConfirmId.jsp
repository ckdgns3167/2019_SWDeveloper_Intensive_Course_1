<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.urline.dao.UserDAO" %>
<title>ID 중복확인</title>
<%
    //한글 깨짐을 방지하기 위한 인코딩 처리
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    UserDAO dao = UserDAO.getInstance();
    int check = dao.confrimId(id);

    if (check == -1) {
%>
<b><span style="color: red; "><%=id%>
</span>는 이미 사용중인 아이디입니다.</b>
<form name="checkForm" method="POST" action="ConfirmId.jsp">
    <b>다른 아이디를 입력해주세요.</b><br/><br/>
    <input type="text" name="id"/>
    <input type="submit" value="ID중복확인"/>
</form>
<%
} else {
%>
<center>
    <b>입력하신 <font color="red"><%=id%>
    </font>는<br/>사용하실 수 있는 ID입니다. </b><br/><br/>
    <input type="button" value="선택하기" onclick="setId()">
</center>
<%
    }
%>
<script language="javascript">
    function setId() {

        opener.document.userInfo.id.value = "<%=id%>";
        opener.document.userInfo.confirm_id.disabled = 'disabled';
        opener.document.userInfo.confirm_id.value = "사용가능";
        opener.document.userInfo.id.readOnly = 'readOnly';
        /*
        form submit 전송시에
        disabled -> action페이지에 값 전송 안됨.
        readonly -> action페이지에 값 전송 됨.
         */
        self.close();

    }
</script>