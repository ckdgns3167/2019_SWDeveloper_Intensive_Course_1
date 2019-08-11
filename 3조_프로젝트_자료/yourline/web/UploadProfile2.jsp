<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%


    String path = application.getRealPath("/upload");
    MultipartRequest mpr = new MultipartRequest(request, path, 1024 * 1024 * 20, "UTF-8", new DefaultFileRenamePolicy());

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }
    Connection con = null;
    PreparedStatement stmt = null;

    try {
        con = DriverManager.getConnection(
                "jdbc:oracle:thin:@127.0.0.1:1521:orcl", "hr", "hr");

        String fsn = "./upload/" + mpr.getFilesystemName("f_file");
        stmt = con.prepareStatement(
                "update usert set profile = ? where id = ?");
        stmt.setString(1, fsn);
        stmt.setString(2, session.getAttribute("userId").toString());
        System.out.println(session.getAttribute("userId"));
        System.out.println(fsn);

        int rownum = stmt.executeUpdate();
        if(rownum >0){
            System.out.println("변경성공");
            session.setAttribute("profile", fsn);
        }else
        {
            System.out.println("실패");
        }

    } catch (Exception e) {
        System.out.println(e.getMessage());
    }
    finally {
        //사용한 객체 close
        try {
            if(con != null) con.close();
            if(stmt != null) stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    response.sendRedirect("./Mypage.jsp");

%>OK

