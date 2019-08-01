package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BangMyung2Add2 extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BangMyung2Add2");
		String gul = request.getParameter("gul");
		BangMyungVO vo = new BangMyungVO();
		vo.setGul(gul);
		BangMyungDAO dao = new BangMyungDAO_KaraImpl();
		try {
			dao.add(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("/study2/bangmyung_list");
	}

}
