<%@ page import="com.urline.dao.Util" %>
<%@ page import="com.urline.dao.CommentDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    // 인코딩 처리
    request.setCharacterEncoding("UTF-8");
    String ctxPath = request.getContextPath();

    Object userId = session.getAttribute("userId");
    String id = userId.toString();

    Integer point = Util.parseInt(request.getParameter("point"));
    String comment = request.getParameter("comment");
    String phone = request.getParameter("phone");
    Integer postNo = Util.parseInt(request.getParameter("postNo"));

    CommentDAO dao = CommentDAO.getInstance();

    System.out.println(id);
    System.out.println(point);
    System.out.println(comment);
    System.out.println(phone);
    System.out.println(postNo);
    //db에 회원정보 commit
    try {
        dao.insertComment("insert into commentt values (seq_comment.nextval, SYSDATE, ?, 0, ?,?,?,?)", comment, point, id, postNo , phone);
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect("./Main.jsp");
%>