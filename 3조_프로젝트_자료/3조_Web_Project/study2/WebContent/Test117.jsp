<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%><%!
  		
    	String getColor(){
    		char[] chs = "0123456789abcdef".toCharArray();
    		StringBuffer sb = new StringBuffer();
    		for(int i = 0; i < 6; i++){
    			sb.append(chs[(int)(Math.random()*16)]);
    		}
    		return sb.toString();
    	}
    %>
<!DOCTYPE html>
<html>
<body>
	<table>
		<%
			for(int i = 1; i <= 9 ; i++){
		%>		
		<tr>
				<%
				for(int j = 1 ; j <= 9; j++){
				%>
					<td bgcolor="#<%=getColor()%>">
						<%=j%> x <%=i%> = <%=i*j%>
					</td>
				<%
				}
				%>
		</tr>
			<%
			}
			%>
	</table>
</body>
</html>