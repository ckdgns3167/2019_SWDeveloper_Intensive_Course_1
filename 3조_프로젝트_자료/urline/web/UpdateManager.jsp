<%@ page import="com.urline.dao.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<%
    String IDtoModify = request.getParameter("userId");
    session.setAttribute("IDtoModify",IDtoModify);
    UserDAO dao = UserDAO.getInstance();
    String nickname = dao.getProperty(IDtoModify, "nickname").toString();
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

    function nameConditionCheck() {
        if (!regularExCheck(/^[가-힝]{2,}$/, document.getElementById("name"), "한글만 입력하세요.(2글자 이상)")) {
            document.ManagerModifyForm.name.value = "";
        }
    }

    function nicknameConditionCheck() {
        if (!regularExCheck(/^[가-힝]{2,}$/, document.getElementById("renickname"), "한글만 입력하세요.(2글자 이상)")) {
            document.ManagerModifyForm.nickname.value = "";
        }
    }

    function phoneConditionCheck() {
        if (!regularExCheck(/^\d{3}\d{4}\d{4}$/, document.getElementById("rephone"), "핸드폰 번호를 입력하세요.\n예)01012341234")) {
            document.ManagerModifyForm.phone.value = "";
        }
    }

    function sexConditionCheck() {
        if (!regularExCheck(/^[1-2]$/, document.getElementById("resex"), "남자는 1, 여자는 2로 입력해주세요.")) {
            document.ManagerModifyForm.sex.value = "";
        }
    }

    function pointConditionCheck() {
        if (!regularExCheck(/^[0-9]+$/, document.getElementById("repoint"), "숫자만 입력하세요.")) {
            document.ManagerModifyForm.point.value = "";
        }
    }

    function gradeConditionCheck() {
        if (!regularExCheck(/^[0-6]{0,1}[0-9]{0,1}[0-9]{0,1}[0-9]{1}$/, document.getElementById("regrade"), "등급은 0 ~ 6000 사이의 값을 갖습니다.")) {
            document.ManagerModifyForm.grade.value = "";
        }
    }

    function pw1ConditionCheck() {
        if (!regularExCheck(/^[a-zA-Z0-9]{8,20}$/, document.getElementById("repw1"), "알맞은 형식의 비밀번호를 입력하세요.\n( 8자리 이상...최대 20, 문자 + 숫자")) {
            document.ManagerModifyForm.pw1.value = "";
        }
    }

    function pw2ConditionCheck() {
        if (document.ManagerModifyForm.pw1.value != document.ManagerModifyForm.pw2.value) {
            alert("비밀번호를 동일하게 입력하세요.");
            document.ManagerModifyForm.pw2.value = "";
            document.ManagerModifyForm.pw2.value = "";
        }
    }
</script>

<style>
    table {
        border: 6px;
    }
</style>
<div style="text-align: center">
    <b><span style="color: red; "><%=nickname%></span> 회원님의 정보를 수정하세요.</b>
</div>
<div style="width: 400px;height:130px;margin-left: 150px; margin-right: auto;">
    <form name="ManagerModifyForm" method="POST" action="UpdateManager_reConfirm.jsp" style="margin-top: 20px;">
        <table>
            <tr>
                <td>이&nbsp&nbsp&nbsp름</td>
                <td><input type="text" name="name" id="reName" onchange="nameConditionCheck()"/></td>
                <!--아이디 변경-->
            </tr>
            <tr>
                <td>닉네임</td>
                <td><input type="text" name="nickname" id="renickname" onchange="nicknameConditionCheck()"/></td>
                <!--닉네임 변경-->
            </tr>
            <tr>
                <td>핸드폰</td>
                <td><input type="text" name="phone" id="rephone" onchange="phoneConditionCheck()"/></td><!--핸드폰 변경-->
            </tr>
            <tr>
                <td>성&nbsp&nbsp&nbsp별</td>
                <td><input type="text" name="sex" id="resex" onchange="sexConditionCheck()"/></td><!--성별 변경-->
            </tr>
            <tr>
                <td>포인트</td>
                <td><input type="text" name="point" id="repoint" onchange="pointConditionCheck()"/></td><!--포인트 변경-->
            </tr>
            <tr>
                <td>등&nbsp&nbsp&nbsp급</td>
                <td><input type="text" name="grade" id="regrade" onchange="gradeConditionCheck()"/></td><!--등급 변경-->
            </tr>
            <tr>
                <td>PW입력</td>
                <td><input type="password" name="pw1" id="repw1" onchange="pw1ConditionCheck()"/></td><!--비밀번호 변경-->
            </tr>
            <tr>
                <td>PW확인</td>
                <td><input type="password" name="pw2" id="repw2" onchange="pw2ConditionCheck()"/></td><!--비밀번호 확인-->
            </tr>
        </table>
        <div class="user_button" style=" margin-left: 20%; margin-top: 10px;">
            <input type="submit" value="수정" style=" background-color: white; border-radius: 5px;"/>
            <input type="button" value="취소" onclick="close()" style=" background-color: white;border-radius: 5px;"/>
        </div>
    </form>
</div>
