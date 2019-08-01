package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FormTestServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("FormTestServlet");
		//http://localhost:8081/study2/test_02.html 
		String gul = request.getParameter("gul");
		System.out.println("gul : "+ gul);
		
		String abcd = request.getParameter("abcd");
		String xyzz = request.getParameter("xyzz");
		
		System.out.println("abcd : "+ abcd);
		System.out.println("xyzz : "+ xyzz);
		
		String method = request.getParameter("method");
		System.out.println("method : " + method);
		
		String pwd = request.getParameter("pwd");
		System.out.println("pwd : " + pwd);
		
		String content = request.getParameter("content");
		System.out.println("content : " + content);
		
		String fruit = request.getParameter("fruit");
		System.out.println("fruit : " + fruit);
		
		response.sendRedirect("/study2/test_02.html ");//컨텍스트 경로, 파일 경로
	}
	
}
