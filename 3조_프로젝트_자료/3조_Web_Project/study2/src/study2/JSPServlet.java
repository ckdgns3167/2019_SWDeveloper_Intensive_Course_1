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
	// <%! ... %> �� ���⿡ �´�.(����ǥ ����)
	int i = 0;

	// ------------------------------------------------------------------------------------
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		PrintWriter out = res.getWriter();

		// ------------------------------------------------------------------------------------
		// <% ... %> �� ���⿡ �´�.(����ǥ ����)
		// <%=... %> �� out.println(...); ���� �����ش�.
		int j = 0;
		out.println(i++);
		out.println(j++);
		
		// Test115.jsp ������ �̰Ͱ� ������ ���·� ��ȯ�ǰ� �����ϵǰ�
		// �ν��Ͻ� ��������� ����� �ڿ� ����ȴ�.  
		// ------------------------------------------------------------------------------------

		out.flush();
		out.close();
	}

}
