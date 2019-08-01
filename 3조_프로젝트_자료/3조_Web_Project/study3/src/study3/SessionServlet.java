package study3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionServlet extends HttpServlet {
	// http://localhost:8081/study3/state?use=readCookie : JSESSIONID ���� ���δ�.
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		// ó���� true, ���Ŀ��� false
		HttpSession session = req.getSession();
		System.out.println(session.isNew());

		session.setAttribute("apple", "Object!!!");
		Object value = session.getAttribute("apple");
		System.out.println(value);
	}
	/*
	 	���� getSession() ȣ��� ���� �����ѹ��� ���� ��û�� ���´�.
	 	- �����Ҹ� ���� : Map<String,Object> ����
	 	- ������ȣ�� ����
	 	- JSESSIONID Ű ������ �����ѹ��� ��Ű�� ����.
	 	
	 	�� ���Ŀ� getSession() ȣ���ϸ� �����ѹ� ���� ������ �װɷ� �����Ҹ� ã�´�.
	 	"������ ���� �������� �����Ұ� �����ȴ�."
	 	
	 	��Ű�� ������ ���� ����ϴ�. - ���������� �������� ��� �����̴�.
	 	1. ��Ű�� �������ʿ� , ������ ���� �ʿ� �������� ����.
	 	2. ��Ű�� ������ �̿���. ������ Map�� �̿���.
	 	3. ��Ű�� ������ �����ϴ�. ������ ��ƴ�.
	 	
	 	�ʹݿ� ����, ���� ��Ű�� ���� ���� ������ �ִ�......
	 */

}
