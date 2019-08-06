<%@ page import="com.urline.dao.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    UserDAO dao = UserDAO.getInstance();
    String id = session.getAttribute("userId").toString();
    String pw = dao.getProperty(id, "pw").toString();
    //수정하기 폼에 입력된 값
    String reNickname = request.getParameter("nickname");
    String rePhone = request.getParameter("phone");
    String rePw = request.getParameter("pw1");

    session.setAttribute("reNickname",reNickname);
    session.setAttribute("rePhone",rePhone);
    session.setAttribute("rePw",rePw);
%>
<html>
    <head>
        <script>
            function pwCheck(){
                if(document.comfirmPwForm.comfirmPw.value==<%=pw%>){
                    console.log("close 전");
                    self.close();
                    console.log("close 후");
                    return true;
                }else{
                    alert("비밀번호가 일치하지 않습니다.\n다시 입력하세요.")
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <b>수정을 완료하기 위해 비밀번호를 입력해주세요</b>
        <form method="POST" action="UserInfoModify_process2.jsp" name="comfirmPwForm" onsubmit="return pwCheck()">
            <table>
                <tr>
                    <td><input type="password" name="comfirmPw" id="comfirmPw"/></td>
                    <td><input type="submit" value="확인"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
