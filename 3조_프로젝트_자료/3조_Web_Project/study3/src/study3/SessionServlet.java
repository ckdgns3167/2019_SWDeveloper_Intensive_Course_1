package study3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionServlet extends HttpServlet {
	// http://localhost:8081/study3/state?use=readCookie : JSESSIONID 값이 보인다.
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		// 처음만 true, 이후에는 false
		HttpSession session = req.getSession();
		System.out.println(session.isNew());

		session.setAttribute("apple", "Object!!!");
		Object value = session.getAttribute("apple");
		System.out.println(value);
	}
	/*
	 	최초 getSession() 호출시 에는 고유넘버가 없이 요청이 들어온다.
	 	- 기억장소를 생성 : Map<String,Object> 형태
	 	- 고유번호를 생성
	 	- JSESSIONID 키 값으로 고유넘버를 쿠키에 저장.
	 	
	 	그 이후에 getSession() 호출하면 고유넘버 물고 왔으니 그걸로 기억장소를 찾는다.
	 	"브라우저 마다 개별적인 기어장소가 생성된다."
	 	
	 	쿠키와 세션은 많이 비슷하다. - 브라우저마다 개별적인 기억 공간이다.
	 	1. 쿠키는 브라우저쪽에 , 세션은 서버 쪽에 기억공간이 있음.
	 	2. 쿠키는 파일을 이용함. 세션은 Map을 이용함.
	 	3. 쿠키는 조작이 가능하다. 세션은 어렵다.
	 	
	 	초반엔 세션, 요즘엔 쿠키를 많이 쓰는 경향이 있다......
	 */

}
