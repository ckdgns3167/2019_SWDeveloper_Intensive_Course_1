package study2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloWorld3 extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		List<BangMyungVO> ls = new ArrayList<BangMyungVO>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "HR");
			Statement stmt = conn.createStatement();
			String sql = "SELECT no, gul, the_time FROM bangmyung_t";
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				BangMyungVO vo = new BangMyungVO();
				vo.setNo(rs.getInt(1));
				vo.setGul(rs.getString(2));
				vo.setTheTime(rs.getString(3));
				ls.add(vo);
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("	<body>");
		out.println("		<table border=\"1\">");
		for (BangMyungVO vo : ls) {
			out.println("			<tr>");
			out.println("				<td bgColor=\"#aabbcc\">");
			out.println(vo.getNo());
			out.println("				</td>");
			out.println("				<td bgColor=\"#aabbcc\">");
			out.println(vo.getGul());
			out.println("				</td>");
			out.println("				<td bgColor=\"#aabbcc\">");
			out.println(vo.getTheTime());
			out.println("				</td>");
			out.println("			</tr>");
		}
		out.println("		<table>");
		out.println("	</body>");
		out.println("</html>");
		out.close();
	}

}
