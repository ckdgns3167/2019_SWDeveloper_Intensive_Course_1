<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.urline.dao.UserDAO" %>
<%@ page import="com.urline.dao.Util" %>

<%
    // 한글 깨짐을 방지하기 위한 인코딩 처리
    request.setCharacterEncoding("UTF-8");
    String ctxPath = request.getContextPath();

    // 회원 정보를 DB에 넣어주기 위해 입력 값들을 가져옴
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String nickName = request.getParameter("nickname");
    Integer sex = Util.parseInt(request.getParameter("sex"));
    String phone = request.getParameter("phone");

    UserDAO dao = UserDAO.getInstance();
    //db에 회원정보 commit
    try {
        dao.insertUser("insert into usert values (seq_userno.nextval,?,?,?,?,?,?,?,?,?)", id, pw, phone,
                nickName, 0, 1000, sex, name, 2);
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect(ctxPath + "/Login.jsp");
%>

