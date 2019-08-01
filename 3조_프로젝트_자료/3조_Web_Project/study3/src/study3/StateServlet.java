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
		 * 요청 -> 응답, 요청의 방법이 두가지 GET/POST가 있다. GET은 엽서, POST는 택배
		 * 
		 * 엽서의 주소와 내용을 구분하는 선의 역할을 하는게 ? 이다. ? 오른쪽의 내용은 key=value 형태로 구성되고,
		 * req.getParameter를 이용하여 추출할 수 있다.
		 * 
		 * 거의 대부분 GET 방식이고, form 에서 method="POST"로 지정된 경우만 POST 방식
		 * 
		 * Cookie란 ?? 웹브라우저가 요청을 날릴때 쿠키에 들어있는 정보를 물고 간다.
		 * : 쿠키는 장바구니와 로그인 정보를 담는 용도로 쓰면 좋다 !
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
