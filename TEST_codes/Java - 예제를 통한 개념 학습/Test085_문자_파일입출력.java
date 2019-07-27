import java.io.*;

public class Test085_문자_파일입출력 {
	/*
	 OutputStream InputStream : 전송 단위 byte : 바이너리 파일 전송용
	 Reader Writer : 전송 단위 char : 문자로 된 데이터 전송용
	 
	 char 는 2바이트(8비트)이고, 유니코드를 지원한다.
	 유니코드는 모든 글자를 다 포용하지 못한다.(6만자 제한)
	 - 웬만한 글자는 포용한다. 한글 + 영문 + 중국어 + 아랍어 + 일본어...
	 
	 확장가능한 가변길이를 가지는 문자체제를 도입 : UTF-8 (웹 표준)
	 */
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		Writer out = new FileWriter("a.txt");
		out.write('한');
		out.write('글');
		out.write('木');
		out.close();

		Reader in = new FileReader("a.txt");

		System.out.println((char) in.read());
		System.out.println((char) in.read());
		System.out.println((char) in.read());
		in.close();
	}

}
