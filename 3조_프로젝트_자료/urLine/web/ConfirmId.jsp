<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.urline.dao.UserDAO" %>
<title>ID 중복확인</title>
<body style="margin-top: 50px;">
<%
    //한글 깨짐을 방지하기 위한 인코딩 처리
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String id2 = request.getParameter("id2");
    UserDAO dao = UserDAO.getInstance();
    //아이디 중복 확인을 위한 변수
    int check = 0;

    if(id != null ) check = dao.confrimId(id);
    else check = dao.confrimId(id2);

    if (check == -1) {
%>

<div style="width: 430px;height:180px;text-align: center;margin-left: 50px;">
    <b><span style="color: red; ">
    <% if( id2 == null ) {%> <%= id %>
    <%} else{ %> <%= id2 %>
    <%}%>
</span>는 이미 사용중인 아이디입니다.</b>
    <form name="checkForm" method="POST" action="ConfirmId.jsp" onsubmit="return reConfirmId()">
        <b>다른 아이디를 입력해주세요.</b><br/><br/>
        <input type="text" name="id2" id="id2" onchange="idConditionCheck()"  style=" background-color: white; border-radius: 5px;"/>
        <input type="submit" value="ID중복확인"  style=" background-color: white; border-radius: 5px;"/>
    </form>
</div>

<%
} else {
%>
<div style="text-align: center;">
    <% if (id2 == null) {%>
    <b>입력하신 <span style="color: red; "><%=id%>
    <%}else{%>
        <b>입력하신 <span style="color: red; "><%=id2%>
    <%}%>
    </span>는<br/>사용하실 수 있는 ID입니다. </b><br/><br/>
    <input type="button" value="선택하기" onclick="setId()"  style=" background-color: white; border-radius: 5px;">
</div>
<%
    }
%>
</body>
<script language="javascript">
    function setId() {
        <% if(id!=null){%>
        opener.document.userInfo.id.value = "<%=id%>";
        <%}else{%>
        opener.document.userInfo.id.value = "<%=id2%>";
        <%}%>
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

    function regularExCheck(re, e, msg) {
        if (re.test(e.value)) return true;
        alert(msg);
        e.value = "";
        return false;
    }

    function idConditionCheck() {
        return regularExCheck(/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/, document.getElementById("id2"), "잘못된 형식의 ID입니다.");
    }

    function reConfirmId() {
        if (document.checkForm.id2.value == null || document.checkForm.id2.value == "") {
            alert("아이디입력에러: 아이디를 입력하세요.");
            return false;
        }
        return true;
    }
</script>