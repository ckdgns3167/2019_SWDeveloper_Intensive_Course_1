package study3;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 	���� ������� ���ÿ� �����ص� ������ ���ڿ��� ��� ������.
 	-> ������ �ν��Ͻ��� ��� ����ǰ� �ִ�. �޸� ���������� �����̴�.
 	-> �Ѳ����� ���� ���͵� ���� �޸𸮸� �Ҹ��Ѵ�.
 	
 */
public class LifeServlet extends HttpServlet {
	int i = 0;// �������� ����Լ�

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(this.toString());// �ϳ��� �ν��Ͻ��� ��Ȱ����� �� �� �ִ�.

		// ������ ���� ����� ���ÿ� �����ϸ� �������� �����忡 ���� �ϳ��� ���� �ν��Ͻ��� �����ȴ�.
		// �ذ����� ù ��° ���� ������ ���� ��, �� ��° ����ȭ(synchronized)
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		
		// �� synchronized �� �ʿ��ұ�?
		// ���� ��û�� �������� �����尡 �ϳ��� ���� �ν��Ͻ��� ����� �� �ִ�.
		synchronized (this) {
			i = i + 1;
			for (int j = 0; j < 500000; j++) {
				out.println(i);
			}
		}
		out.println("</body></html>");
		out.flush();
		out.close();
	}

}
