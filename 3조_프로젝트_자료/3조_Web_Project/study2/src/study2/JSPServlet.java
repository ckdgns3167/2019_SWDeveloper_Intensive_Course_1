package study2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class JSPServlet extends HttpServlet {
	private ServletContext application = null;
	private ServletConfig config = null;

	@Override
	public void init(ServletConfig config) throws ServletException {
		this.config = config;
		application = config.getServletContext();

	}

	// ------------------------------------------------------------------------------------
	// <%! ... %> 은 여기에 온다.(느낌표 있음)
	int i = 0;

	// ------------------------------------------------------------------------------------
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		PrintWriter out = res.getWriter();

		// ------------------------------------------------------------------------------------
		// <% ... %> 은 여기에 온다.(느낌표 없음)
		// <%=... %> 은 out.println(...); 으로 감싸준다.
		int j = 0;
		out.println(i++);
		out.println(j++);
		
		// Test115.jsp 파일은 이것과 유사한 형태로 변환되고 컴파일되고
		// 인스턴스 만들어지고 적재된 뒤에 실행된다.  
		// ------------------------------------------------------------------------------------

		out.flush();
		out.close();
	}

}
