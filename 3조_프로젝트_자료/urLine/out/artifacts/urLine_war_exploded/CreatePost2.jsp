<%@ page import="com.urline.dao.Util" %>
<%@ page import="com.urline.dao.PostingDAO" %>
<%@ page import="com.urline.dao.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // 한글 깨짐을 방지하기 위한 인코딩 처리
    request.setCharacterEncoding("UTF-8");
    String ctxPath = request.getContextPath();

    // 회원 정보를 DB에 넣어주기 위해 입력 값들을 가져옴
    String  id = session.getAttribute("userId").toString();
    System.out.println(id);
    String start = request.getParameter("start");
    String end = request.getParameter("end");
    String title = request.getParameter("title");
    Integer point = Util.parseInt(request.getParameter("point"));
    String contents = request.getParameter("contents");
    Integer region = Util.parseInt(request.getParameter("region"));

    PostingDAO dao = PostingDAO.getInstance();
    UserDAO udao = UserDAO.getInstance();

    Object opoint = session.getAttribute("userPoint");
    Integer orgpoint = (Integer) opoint;
    orgpoint = orgpoint-point;
    System.out.println(orgpoint);
    try {
        udao.updateUser("update usert set point = ? where id = ?", orgpoint, id);
        session.setAttribute("userPoint", orgpoint);
    } catch (Exception e) {
        e.printStackTrace();
    }

    //db에 회원정보 commit
    try {
        dao.insertPosting("insert into postt values (seq_postno.nextval, ?, ?, SYSDATE,?,?,?,?, '"+ id +"', '"+ contents +"')", title, region, point, 1, start, end);
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect(ctxPath + "/Main.jsp");
%>
