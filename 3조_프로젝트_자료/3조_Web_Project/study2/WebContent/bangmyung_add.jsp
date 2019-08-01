<%@ page contentType="text/html; charset=utf-8" pageEncoding="EUC-KR"
	import="study2.BangMyungVO,
			study2.BangMyungDAO,
			study2.BangMyungDAO_OracleImpl"
%>
<%
	Exception err = null;
	String gul = request.getParameter("gul");
	BangMyungVO vo = new BangMyungVO();
	vo.setGul(gul);
	
	BangMyungDAO dao = new BangMyungDAO_OracleImpl();
	try{
		dao.add(vo);
	}catch(Exception e){
		err = e;
	}
	
	if(err!= null){
		response.sendRedirect("/study2/error.jsp");
	}else{
		response.sendRedirect("/study2/bangmyung_list.jsp");
%>
<!DOCTYPE html>
<html>
<body>

</body>
</html>
<%}%>