<%@ page import="com.urline.dao.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script language="javascript">
    function close() {//창 닫기
        window.close();
    }
    function instructionMessage() {//아무것도 입력안하는거 막아주기
        if (document.ManagerDeleteForm.pw4.value == "") {
            alert("비밀번호를 입력하세요.");
            return false;
        }
        return true;
    }
</script>
<%
    String IDtoDelete = request.getParameter("userId");
    session.setAttribute("IDtoDelete",IDtoDelete);
    UserDAO dao = UserDAO.getInstance();
    String nickname = dao.getProperty(IDtoDelete, "nickname").toString();
%>
<div style="text-align: center">
    <b><span style="color: red; "><%=nickname%></span> 님의 계정을 정말 삭제하시겠습니까?</b><br/>
    <b>관리자 비밀번호를 입력해주세요.</b><br/><br/>
</div>
<div style="width: 350px;height:50px;margin-left: 175px; margin-right: auto;">
    <form name="ManagerDeleteForm" method="POST" action="DeleteManager_process2.jsp" onsubmit="return instructionMessage()">
        <input type="password" name="adminPW" id="adminPW"/>
        <div style=" margin-left: 40px;  margin-top: 10px;">
            <input type="submit" value="삭제" style="background-color: white; border-radius: 5px;"/>
            <input type="button" value="취소" onclick="close()"  style="background-color: white; border-radius: 5px;"/>
        </div>
    </form>
</div>
