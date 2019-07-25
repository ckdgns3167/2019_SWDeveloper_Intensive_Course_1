

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

//package temp;
public class Test082C_소켓_클라이언트 {// 클라이언트 : 서버에 찾아가는 역할

	public static void main(String[] args) throws Exception {
		Socket skt = new Socket("192.168.2.74", 1123);
		// OutputStream으로 상속받은 뭔가를 생성하고 리턴. out이 가리킴
		OutputStream out = new FileOutputStream("copy.txt");
		InputStream in = skt.getInputStream();
		int r = 0;
		while((r=in.read())!=-1) {
			out.write(r);
		}
		
		out.flush();
		out.close();
		skt.close();

	}

}
