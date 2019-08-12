<%@ page import="com.urline.dao.Util" %>
<%@ page import="com.urline.dao.PostingDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%


    request.setCharacterEncoding("UTF-8");
    String ctxPath = request.getContextPath();

    // 회원 정보를 DB에 넣어주기 위해 입력 값들을 가져옴
    String  id = session.getAttribute("userId").toString();
    Integer postNo = Util.parseInt(request.getParameter("postNo"));
    String start = request.getParameter("start");
    String end = request.getParameter("end");
    String title = "(수정됨) " + request.getParameter("title");
    Integer point = Util.parseInt(request.getParameter("point"));
    String contents = request.getParameter("contents");
    Integer region = Util.parseInt(request.getParameter("region"));

    PostingDAO dao = PostingDAO.getInstance();
    //db에 회원정보 commit
    try {
        dao.updatePosting("update postt set title = ?, region = ?, b_hopefulPoint = ?, requesttime = ?, endtime= ?, contents = ? where postno = ?", title, region, point, start, end, contents, postNo);
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect(ctxPath + "/Main.jsp");
%>