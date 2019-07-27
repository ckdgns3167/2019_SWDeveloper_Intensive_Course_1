import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class Test083_데코레이터_io {

	public static void main(String[] args) throws IOException {
		/*
		 IGreet ig = new SharpDeco(new HelloGreet());
		 ig.greet();
		 - 이전에 배웠던 데코레이터 패턴 예제 (숙제였음)
		 
		 out.write(..) 호출했을 때 대상은 FileOutputStream 에서 지정한다.
		 BufferedOutputStream에서 버퍼링을 제공한다.
		 -두 클래스가 결합한 결과를 만드는데 사용자는 OutputStream에서 지정하는 함수만 사용하면 된다. 
		 
		 : 이 두개는 실제로 같은 설계기법으로 구현된 코드이다. 
		 */
		
		//데코레이터 패턴으로 인한 파일 복사 성능의 향상
		OutputStream out = new BufferedOutputStream(new FileOutputStream("c.dat"));
		InputStream in = new BufferedInputStream(new FileInputStream("d.dat"));

		int r = 0;
		while ((r = in.read()) != -1)
			out.write(r);
		out.close();
		in.close();

	}
	/*
	 * java.io 패키지가 데코레이터 패턴이라는 설계기법으로 구현되었다. - HelloGreet MerciGreet StarDeco
	 * SharpDeco : 데코레이터 패턴의 예제
	 */
}
