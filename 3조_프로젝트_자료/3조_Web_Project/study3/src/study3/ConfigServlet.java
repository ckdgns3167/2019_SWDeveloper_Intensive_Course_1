package study3;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConfigServlet extends HttpServlet {
	/*
	 * ������ �ν��Ͻ��� ��Ȱ��ȴ�.
	 * 
	 * �ν��Ͻ��� ��Ȱ���� ���� ���������� ����Ǵµ�, ����Ǵ� ������ ȣ��Ǵ� �Լ��� init - ���� ��û�ÿ��� ȣ��ȴ�.
	 */
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("service");

		// ���ؽ�Ʈ ���
		String l = request.getContextPath();
		System.out.println("getContextPath : " + l);

		// IP �ּ� ���� ������ ��ü���
		String m = request.getRequestURI();
		System.out.println("getRequestURI : " + m);

		// ������ �������� IP �ּ� ��
		String g = request.getRemoteAddr();
		System.out.println("getRemoteAddr : " + g);

		/*
		 ������ �������� �ü�� ������ ���� ���ڿ��� �������. 
		 �̰��� �̿��Ͽ� ����Ϸ� �����Ѱ��� ������ ������ ���� �� �� �ְ�
		 ����Ͽ� ȭ��� ��ǻ�Ϳ� ȭ���� �����Ͽ� ������ ���� �ִ�.
		 */
		String o = request.getHeader("User-Agent");
		System.out.println("getHeader " + o);
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init");

		// web.xml �� ������ ������ �о���� �� �ִ� ����� �����Ѵ�.
		System.out.println(config.getInitParameter("apple"));

		/*
		 * WEB-INF ������ �����ΰ��� ���´�. �������� ���� ���ϴ� ������ ���ε� ������ ���⿡ ���� �����ϴ�. ��� �ް� (������) �ٿ�
		 * ������ FileInputStream ���� �о� ��������. �� �� FileInputStream �� ���� ��θ� �ʿ�� �Ѵ�. �� ��쿡
		 * getRealPath �� �����ϰ� ���ȴ�.
		 */
		ServletContext application = config.getServletContext();
		String path = application.getRealPath("/WEB-INF/");
		System.out.println(path);
	}

	/*
	 * <servlet> <servlet-name>abcd6</servlet-name>
	 * <servlet-class>study3.ConfigServlet</servlet-class> <init-param>
	 * <param-name>apple</param-name> <param-value>blabla</param-value>
	 * </init-param> </servlet>
	 * 
	 * <servlet-mapping> <servlet-name>abcd6</servlet-name>
	 * <url-pattern>/config</url-pattern> </servlet-mapping>
	 */

}
