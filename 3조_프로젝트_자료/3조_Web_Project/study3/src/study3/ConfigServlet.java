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
	 * 서블릿의 인스턴스는 재활용된다.
	 * 
	 * 인스턴스는 재활용을 위해 내부적으로 적재되는데, 적재되는 시점에 호출되는 함수가 init - 최초 요청시에만 호출된다.
	 */
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("service");

		// 컨텍스트 경로
		String l = request.getContextPath();
		System.out.println("getContextPath : " + l);

		// IP 주소 다음 나오는 전체경로
		String m = request.getRequestURI();
		System.out.println("getRequestURI : " + m);

		// 접속한 브라우저의 IP 주소 값
		String g = request.getRemoteAddr();
		System.out.println("getRemoteAddr : " + g);

		/*
		 접속한 브라우저와 운영체제 정보를 담은 문자열이 얻어진다. 
		 이것을 이용하여 모바일로 접근한건지 컴으로 접근한 건지 알 수 있고
		 모바일용 화면과 컴퓨터용 화면을 구분하여 제공할 수도 있다.
		 */
		String o = request.getHeader("User-Agent");
		System.out.println("getHeader " + o);
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init");

		// web.xml 에 설정된 내용을 읽어들일 수 있는 방법을 제공한다.
		System.out.println(config.getInitParameter("apple"));

		/*
		 * WEB-INF 폴더의 절대경로값을 얻어온다. 브라우저가 접근 못하는 폴더가 업로드 파일을 놓기에 가장 적합하다. 허락 받고 (돈내고) 다운
		 * 받을때 FileInputStream 으로 읽어 내보낸다. 그 때 FileInputStream 은 절대 경로를 필요로 한다. 그 경우에
		 * getRealPath 는 유용하게 사용된다.
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
