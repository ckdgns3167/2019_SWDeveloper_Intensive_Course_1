package study2;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// /bangmyung_list 로 요청이 들어오면 보여지게 세팅해 보자.
public class BangMyung2List extends HttpServlet {

	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("BangMyung2List");
		BangMyungDAO dao = new BangMyungDAO_OracleImpl();
		List<BangMyungVO> ls = null;
		try {
			ls = dao.findAll();
		} catch (Exception e) {

			
		}
		resp.setContentType("text/html;charset=euc-kr");
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("	<body>");
		out.println("		<table border=\"0\" cellspacing=\"2\" cellpadding=\"12\">");
		
		int i = 0;
		for (BangMyungVO vo : ls) {
			String color = ((++i % 2) == 0) ? "#aabbcc" : "#ccddee";
			out.println("			<tr>");
			out.println("				<td bgColor='" + color + "'>");
			out.println(vo.getNo());
			out.println("				</td>");
			out.println("				<td bgColor='" + color + "'>");
			out.println(vo.getGul());
			out.println("				</td>");
			out.println("				<td bgColor='" + color + "'>");
			out.println(vo.getTheTime());
			out.println("				</td>");
			out.println("			</tr>");
		}
		out.println("		<table>");

		/*
		 * <form method=\"POST\" action=\"bangmyung_add2\"> <input
		 * type=\"text\" name=\"\" size=\"50\"/> <input type=\"submit\"/> </form>
		 */
		out.println("<form method=\"POST\" action=\"bangmyung_add2\">");
		out.println("<input type=\"text\" name=\"gul\" size=\"50\"/>");
		out.println("<input type=\"submit\"/>");
		out.println("</form>");

		out.println("	</body>");
		out.println("</html>");
		out.close();
	}

}
