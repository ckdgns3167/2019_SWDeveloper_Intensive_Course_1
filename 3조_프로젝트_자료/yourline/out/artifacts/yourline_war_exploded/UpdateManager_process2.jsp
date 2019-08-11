<%@ page import="com.urline.dao.UserDAO" %>
<%@ page import="com.urline.dao.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

    request.setCharacterEncoding("UTF-8");
    UserDAO dao = UserDAO.getInstance();

    String IDtoModify = session.getAttribute("IDtoModify").toString();
    //수정할 회원의 원래 갖고 있던 이름, 닉네임, 전화번호, 성별, 포인트, 등급, 비밀번호의 정보...
    String name = (String) dao.getProperty(IDtoModify,"name");
    String nickname = (String)dao.getProperty(IDtoModify, "nickname");
    String phone = (String)dao.getProperty(IDtoModify, "phone");
    Integer sex = (Integer)dao.getProperty(IDtoModify, "sex");
    Integer point = (Integer)dao.getProperty(IDtoModify, "point");
    Integer grade = (Integer)dao.getProperty(IDtoModify, "grade");
    String pw = (String)dao.getProperty(IDtoModify, "pw");

    String reName = session.getAttribute("reName").toString();
    String reNickname = session.getAttribute("reNickname").toString();
    String rePhone = session.getAttribute("rePhone").toString();
    String reSex = session.getAttribute("reSex").toString();
    String rePoint = session.getAttribute("rePoint").toString();
    String reGrade = session.getAttribute("reGrade").toString();
    String rePw = session.getAttribute("rePw").toString();

    if (!(name.equals(reName) || reName.equals(""))) {
        dao.updateUser("UPDATE usert SET name = ? WHERE id = '" + IDtoModify + "'", reName);
    }
    if (!(nickname.equals(reNickname) || reNickname.equals(""))) {
        dao.updateUser("UPDATE usert SET nickname = ? WHERE id = '" + IDtoModify + "'", reNickname);
    }
    if (!(phone.equals(rePhone) || rePhone.equals(""))) {
        dao.updateUser("UPDATE usert SET phone = ? WHERE id = '" + IDtoModify + "'", rePhone);
    }
    if (!((sex==Util.parseInt(reSex)) || reSex.equals(""))) {
        dao.updateUser("UPDATE usert SET sex = ? WHERE id = '" + IDtoModify + "'", reSex);
    }
    if (!((point==Util.parseInt(rePoint)) || rePoint.equals(""))) {
        System.out.println(rePoint);
        dao.updateUser("UPDATE usert SET point = ? WHERE id = '" + IDtoModify + "'", rePoint);
    }
    if (!((grade==Util.parseInt(reGrade))|| reGrade.equals(""))) {
        dao.updateUser("UPDATE usert SET grade = ? WHERE id = '" + IDtoModify + "'", reGrade);
    }
    if (!(pw.equals(rePw) || rePw.equals(""))) {
        dao.updateUser("UPDATE usert SET pw = ? WHERE id = '" + IDtoModify + "'", rePw);
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
