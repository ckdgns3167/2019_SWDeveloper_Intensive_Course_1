package temp;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;


public class Test079_InputStream의_기본 {
	/*
	 in.read() 는 오버라이딩 된 코드일까? inputStream에서 선언된 걸까?
	 - 코드를 읽는 눈이 있어야한다.
	 
	 in.read() : 한 바이트씩 읽어들이는 역할
	 더 이상 읽을 것이 없을 때 -1이 나온다.
	 
	 Stream (Input/Output) 개념
	 - byte 단위로 전송한다.
	 - 순서대로 읽고 순서대로 내보낸다.
	 - 중간 부분만 따로 읽고 내보내는 개념이없다. 무조건 처음부터 끝까지!
	 - 다 썼으면 반드시 close는 호출해 주어야 한다.
	 */
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		InputStream in = new FileInputStream("a.dat");
		
		int a = in.read();
		int b = in.read();
		int c = in.read();
		int d = in.read();
		int e = in.read();
		
		in.close();
		
		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		System.out.println(d);
		System.out.println(e);
		
	}

}
