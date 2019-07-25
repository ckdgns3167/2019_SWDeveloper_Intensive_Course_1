

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class Test082S_소켓_서버 {// 서버 : 대기

	/*
		대기하는 쪽 : 서버, 찾아가는 쪽 : 클라이언트
		먼저 서버가 구동된다. - 포트를 물고 구동해야 한다.(1123)
    	accept : 대기하다가 클라이언트가 찾아오면 소켓을 생성해서 리턴
    
       	클라이언트가 찾아가기 위해? IP, PORT번호
       	잘 찾아가지면 Socket이 생성된다. 
       	
       	접속 성공시 양쪽에서는 Socket이 생성되고 이 둘은 통신이 가능하다.
	 */
	
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		ServerSocket svr = new ServerSocket(1123);// 포트연결! 포트번호는 정수
		// 중복되는 포트번호로 서버를 만들지 못함!

		System.out.println("before accept");
		Socket skt = svr.accept();// 대기하다가 클라이언트의 소켓과 연결됨. 양쪽 소켓이 생성.
		System.out.println("after accept");
		
		InputStream in = new FileInputStream("a.txt");
		OutputStream out = skt.getOutputStream();
		int r = 0;
		byte[] buf = new byte[1024 * 8];
		while ((r = in.read(buf)) != -1) {
			out.write(buf, 0, r);
			out.flush();
		}
		in.close();
		in.close();
		skt.close();
		svr.close();
	}

}
