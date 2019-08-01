<%@ page contentType="text/html; charset=utf-8" errorPage="error.jsp" pageEncoding="EUC-KR"
	import="java.util.List, 
    		study2.BangMyungVO, 
    		study2.BangMyungDAO, 
    		study2.BangMyungDAO_OracleImpl,
    		study2.BangMyungDAO_KaraImpl"%>
<%
	//1. 변수선언
	List<BangMyungVO> rl = null;
	Exception err = null;

	//2. DB연동
	BangMyungDAO dao = new BangMyungDAO_OracleImpl();
	try {
		rl = dao.findAll();
	} catch (Exception e) {
		err = e;
	}
	//3. 흐름만들기
	if (rl == null || err != null) {
		HttpSession ss = request.getSession();
		ss.setAttribute("error", err);
		response.sendRedirect("/study2/error.jsp");
	} else {
%>
<!DOCTYPE html>
<html>
<body>
	<table border="1" cellspacing="2" cellpadding="12" style="text-align:center;">
		<tr >
			<td>No</td>
			<td>Gul</td>
			<td>Time</td>
		</tr>
		<%
		int i = 0;
		for (BangMyungVO vo : rl) {
			String color = ((++i % 2) == 0) ? "#aabbcc" : "#ccddee";
		%>
		<tr>
			<td bgColor='<%=color %>'>
			<%=vo.getNo()%>
			</td>
			<td bgColor='<%=color %>'>
			<%=vo.getGul()%>
			</td>
			<td bgColor='<%=color %>'>
			<%=vo.getTheTime()%>
			</td>
		</tr>
		<%
		}
		%>
	</table>
	
	<br/><br/><br/>
	<form method="POST" action="bangmyung_add.jsp">
		<input type="text" name="gul" size="50"/>
		<input type="submit"/>
	</form>
</body>
</html>
<%
	}
%>
