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
        dao.updateUser("UPDATE usert SET nickname = ?", reNickname);
    }
    if (!(phone.equals(rePhone) || rePhone.equals(""))) {
        dao.updateUser("UPDATE usert SET phone = ?", rePhone);
    }
    if (!(pw.equals(rePw) || rePw.equals(""))) {
        dao.updateUser("UPDATE usert SET pw = ?", rePw);
    }
%>
