<%@ page import="com.urline.dao.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%
    Integer point = Integer.valueOf(request.getParameter("point"));
    System.out.println(point);

    request.setCharacterEncoding("UTF-8");

    UserDAO dao = UserDAO.getInstance();

    String id = session.getAttribute("userId").toString();

    Integer beforePoint = Integer.valueOf(session.getAttribute("userPoint").toString());
    Integer afterPoint = beforePoint + point;

    try {
        dao.updateUser("UPDATE usert SET point = ? WHERE id = '" + id + "'", afterPoint);
        session.setAttribute("userPoint", afterPoint);
    } catch (Exception e) {
        e.printStackTrace();
    }

%>OK