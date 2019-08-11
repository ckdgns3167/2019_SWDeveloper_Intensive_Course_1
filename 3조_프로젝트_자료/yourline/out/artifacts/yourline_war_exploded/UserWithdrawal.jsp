<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script language="javascript">
    function close() {//창 닫기
        window.close();
    }
    function instructionMessage() {//아무것도 입력안하는거 막아주기
        if (document.wirhdrawalForm.pw3.value == "") {
            alert("비밀번호를 입력하세요.");
            return false;
        }
        return true;
    }
</script>
<%
        request.setCharacterEncoding("UTF-8");
    String nickname = session.getAttribute("userNickname").toString();
%>
<body style="margin-top: 30px">
<div style="text-align: center;">
    <b><span style="color: red; "><%=nickname%></span> 회원님! 정말 탈퇴하시겠습니까?</b>
</div>
<div style="width: 350px;height:100px;position: absolute;margin-left: 30%;">
    <form name="withdrawalForm" method="POST" action="UserWithdrawal_process2.jsp" onsubmit="return instructionMessage()">
        <b>비밀번호를 입력해주세요.</b><br/><br/>
        <input type="password" name="pw3" id="pw3"/>
        <div style=" margin-left: 40px;  margin-top: 10px;">
            <input type="submit" value="탈퇴" style="background-color: white; border-radius: 5px;"/>
            <input type="button" value="취소" onclick="close()"  style="background-color: white; border-radius: 5px;"/>
        </div>
    </form>
</div>
</body>
