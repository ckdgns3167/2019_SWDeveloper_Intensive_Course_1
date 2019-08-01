<%@ page contentType="text/html; charset=utf-8" isErrorPage="true"
	pageEncoding="EUC-KR"%>
<%
	Exception e = (Exception) session.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<body>
	<%
		StackTraceElement[] st = e.getStackTrace();
		for (int i = 0; i < st.length; i++) {
	%>
	<%=st[i]%>
	<%
		}
	%>
</body>
</html>