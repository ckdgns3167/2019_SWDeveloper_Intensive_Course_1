<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script language="javascript">
    function close() {//창 닫기
        self.close();
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
<b><span style="color: red; "><%=nickname%></span> 회원님!<br/>정말 탈퇴하시겠습니까?</b>
<form name="wirhdrawalForm" method="POST" action="UserWithdrawal_process2.jsp" onsubmit="return instructionMessage()">
    <b>비밀번호를 입력해주세요.</b><br/><br/>
    <input type="text" name="pw3" id="pw3"/>
    <div>
        <input type="submit" value="예"/>
        <input type="button" value="아니오" onclick="close()"/>
    </div>
</form>


