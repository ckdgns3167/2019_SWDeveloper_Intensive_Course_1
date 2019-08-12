<%@ page import="com.urline.dao.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

    request.setCharacterEncoding("UTF-8");
    UserDAO dao = UserDAO.getInstance();

    String id = session.getAttribute("userId").toString();

    //로그인시 원래 갖고 있던 닉네임과, 전화번호, 비밀번호
    String nickname = session.getAttribute("userNickname").toString();
    String phone = session.getAttribute("userPhone").toString();
    String pw = dao.getProperty(id, "pw").toString();

    String reNickname = session.getAttribute("reNickname").toString();
    String rePhone = session.getAttribute("rePhone").toString();
    String rePw = session.getAttribute("rePw").toString();

    if (!(nickname.equals(reNickname) || reNickname.equals(""))) {
        dao.updateUser("UPDATE usert SET nickname = ? WHERE id = '" + id + "'", reNickname);
        session.setAttribute("userNickname", reNickname);
    }
    if (!(phone.equals(rePhone) || rePhone.equals(""))) {
        dao.updateUser("UPDATE usert SET phone = ? WHERE id = '" + id + "'", rePhone);
        session.setAttribute("userPhone", rePhone);
    }
    if (!(pw.equals(rePw) || rePw.equals(""))) {
        dao.updateUser("UPDATE usert SET pw = ? WHERE id = '" + id + "'", rePw);
        session.setAttribute("userPw", rePw);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <script>
            function OK() {
                opener.location.reload();
                window.close();
            }
        </script>
    </head>
    <body>
        <h1><b>수정 완료!</b></h1><br />
        <button onclick="OK()">확인</button>
    </body>
</html>
