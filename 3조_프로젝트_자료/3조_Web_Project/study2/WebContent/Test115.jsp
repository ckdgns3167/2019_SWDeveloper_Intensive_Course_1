<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%><%!
    
    int i = 0;
%><%
	int j = 0;
%>
<!DOCTYPE html>
<html>
<body>
	<%=i++%>
	<%=j++%>
</body>
</html>
<%--
	JSP 주석
	html 파일 요청하듯이 요청한다. (web.xml 수정할 필요 없다.)
	http://localhost:8081/study2/Test115.jsp
	
	i는 멤버변수, j는 로컬변수의 느낌이 난다...
	
	jsp 파일을 요청하면 톰캣은 이것을 *.java 파일로 변환한다. (서블릿 코드)
	이것을 컴파일 하고,  인스턴스를 만들어, 적재하고, 인스턴스 재활용한다.
	JSP는 알고보면 서블릿이네~ 그럼 왜 만든거야? 
	
	"서블릿 이후 ASP의 등장으로 위기를 느낀 자바쪽에서 ASP 비슷한거 만든게 JSP"
--%>