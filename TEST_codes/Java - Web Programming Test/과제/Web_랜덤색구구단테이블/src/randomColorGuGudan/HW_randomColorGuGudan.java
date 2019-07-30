package randomColorGuGudan;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HW_randomColorGuGudan extends HttpServlet {
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("	<body style=\'vertical-align:middle;\'>");
		out.println("		<table border=\"1\" cellspacing=\"0\" cellpadding=\"10\" width=\"950px\" style=\' margin:auto; text-align:center; \'\'>");
		for (int i = 1; i <= 9; i++) {
			out.println("			<tr>");
			for (int j = 1; j <= 9; j++) {
				out.println("				<td  style=\'background-color:rgba(" + randomColor() + ",0.3); font-size:15pt; width: 80px;\'>");
				out.println("<font face=\"Impact\">");
				out.println(j + " x " + i + " = " + i * j);
				out.println("</font>");
				out.println("				</td>");
			}
			out.println("			</tr>");
		}
		out.println("		</table>");
		out.println("	</body>");
		out.println("</html>");

	}

	public String randomColor() {
		int r = (int) (Math.random() * 255);
		int g = (int) (Math.random() * 255);
		int b = (int) (Math.random() * 255);
		return Integer.toString(r) + "," + Integer.toString(g) + "," + Integer.toString(b);

	}
}
