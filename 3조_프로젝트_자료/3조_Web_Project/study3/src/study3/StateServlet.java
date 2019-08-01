package study3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// /studt3/state
public class StateServlet extends HttpServlet {

	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// http://localhost:8081/study3/state?use=addCookie
		/*
		 * ��û -> ����, ��û�� ����� �ΰ��� GET/POST�� �ִ�. GET�� ����, POST�� �ù�
		 * 
		 * ������ �ּҿ� ������ �����ϴ� ���� ������ �ϴ°� ? �̴�. ? �������� ������ key=value ���·� �����ǰ�,
		 * req.getParameter�� �̿��Ͽ� ������ �� �ִ�.
		 * 
		 * ���� ��κ� GET ����̰�, form ���� method="POST"�� ������ ��츸 POST ���
		 * 
		 * Cookie�� ?? ���������� ��û�� ������ ��Ű�� ����ִ� ������ ���� ����.
		 * : ��Ű�� ��ٱ��Ͽ� �α��� ������ ��� �뵵�� ���� ���� !
		 */
		String use = req.getParameter("use");

		if ("addCookie".equals(use)) {
			Cookie ck = new Cookie("name", "apple");
			res.addCookie(ck);
		} else if ("readCookie".equals(use)) {
			Cookie[] cks = req.getCookies();
			if (cks != null) {
				for (int i = 0; i < cks.length; i++) {
					System.out.println(cks[i].getName() + "," + cks[i].getValue());
				}
			}else {
				System.out.println("Cookie is null");
			}
		}
	}

}
