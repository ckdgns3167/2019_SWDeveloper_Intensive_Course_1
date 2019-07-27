import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class Test081_버퍼이용_빠른파일복사 {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		//그냥 인풋스트림에 그냥 파일인풋스트림 인스턴스를 가리키게 하면 느림.
		InputStream in = new FileInputStream("C:\\A\\jdk-6u30-apidocs.zip");
		OutputStream out = new FileOutputStream("C:\\A\\b.zip");
		// 엄청 많이 씀 ! 외우시오!
		int r = 0;
		byte[] buf = new byte[1024 * 8];//8키로바이트를 의미
		while ((r = in.read(buf)) != -1) {//옮겨적는게 엄청 빠름 - 한꺼번에 퍼서 한꺼번에 나른다??
			out.write(buf, 0, r);//0부터 r-1까지 를 한번에 옮김! => '버퍼링'= 복사의 중요한 테크닉
		}
		/*
		 int read(byte[] buf) : buf가 감당가능한 만큼 읽고 , 읽은 데이터 갯수 리턴.
		 void wrtie(byte[] buf, int s, int r) : buf의 내용을 내보낸다. s부터 r만큼
		 */
		out.close();
		in.close();
	}

}
