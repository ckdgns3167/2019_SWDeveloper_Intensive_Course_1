<%@ page import="com.urline.dao.Util" %>
<%@ page import="com.urline.dao.PostingDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String ctxPath = request.getContextPath();

  Integer postNo = Util.parseInt(request.getParameter("postNo"));

  PostingDAO dao = PostingDAO.getInstance();
    try {
        dao.deletePosting("delete from postt where postno = ?",postNo);
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect(ctxPath + "/Main.jsp");
%>
