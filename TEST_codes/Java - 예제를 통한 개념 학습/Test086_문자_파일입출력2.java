import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.Writer;

public class Test086_문자_파일입출력2 {
	/*
	 OutputStreamWriter InputStreamReader 는 char 입출력을
	 byte 입출력으로 전환해준다.
	 (220 볼트를 110 볼트로 바꾼듯 2 byte 입출력을 1 byte로 바꿔준다.)
	 */
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		Writer out = new OutputStreamWriter(new FileOutputStream("a.txt"));
		out.write('한');
		out.write('글');
		out.write('木');
		out.close();

		Reader in = new InputStreamReader(new FileInputStream("a.txt"));

		System.out.println((char) in.read());
		System.out.println((char) in.read());
		System.out.println((char) in.read());
		in.close();
	}

}
