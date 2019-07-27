import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class Test084_1_1바이트_255까지 {

	public static void main(String[] args) throws IOException {
		/*
		 * 이게 왜 깨져서 보내지는지 ? 4바이트 다 보내는게 아니더라..
		 */
		OutputStream out = new FileOutputStream("d.dat");
		out.write(10101);
		out.write(10102);
		out.write(10103);
		out.close();

		InputStream in = new FileInputStream("d.dat");
		int a = in.read();
		int b = in.read();
		int c = in.read();
		int d = in.read();
		in.close();

		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		System.out.println(d);

	}

}
