<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String nickname = session.getAttribute("userNickname").toString();

%>
<script language="javascript">
    function close() {//창 닫기
        self.close();
    }

    function regularExCheck(re, e, msg) {
        if (re.test(e.value)) return true;
        alert(msg);
        e.value = "";
        return false;
    }

    function nicknameConditionCheck() {
        if (!regularExCheck(/^[가-힝]{2,}$/, document.getElementById("renickname"), "한글만 입력하세요.(2글자 이상)")) {
            document.ModifyForm.nickname.value = "";
        }
    }

    function phoneConditionCheck() {
        if (!regularExCheck(/^\d{3}\d{3,4}\d{4}$/, document.getElementById("rephone"), "핸드폰 번호를 입력하세요.\n예)01012341234")) {
            document.ModifyForm.phone.value = "";
        }
    }

    function pw1ConditionCheck() {
        if (!regularExCheck(/^[a-zA-Z0-9]{8,20}$/, document.getElementById("repw1"), "알맞은 형식의 비밀번호를 입력하세요.\n( 8자리 이상...최대 20, 문자 + 숫자")) {
            document.ModifyForm.pw1.value = "";
        }
    }

    function pw2ConditionCheck() {
        if (document.ModifyForm.pw1.value != document.ModifyForm.pw2.value) {
            alert("비밀번호를 동일하게 입력하세요.");
            document.userInfo.pw.value = "";
            document.userInfo.pw.value = "";
        }
    }
</script>
<b><span style="color: red; "><%=nickname%></span> 회원님의 정보를 수정하세요.</b>
<form name="ModifyForm" method="POST" action="UserInfoModify_reComfirm.jsp">
    <table>
        <tr>
            <td>닉네임</td>
            <td><input type="text" name="nickname" id="renickname" onchange="nicknameConditionCheck()"/></td><!--닉네임 변경-->
        </tr>
        <tr>
            <td>핸드폰</td>
            <td><input type="text" name="phone" id="rephone" onchange="phoneConditionCheck()"/></td><!--핸드폰 변경-->
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pw1" id="repw1" onchange="pw1ConditionCheck()"/></td><!--비밀번호 변경-->
        </tr>
        <tr>
            <td>비밀번호 확인</td>
            <td><input type="password" name="pw2" id="repw2" onchange="pw2ConditionCheck()"/></td><!--비밀번호 확인-->
        </tr>
    </table>
    <div>
        <input type="submit" value="수정" />
        <input type="button" value="취소" onclick="close()"/>
    </div>
</form>