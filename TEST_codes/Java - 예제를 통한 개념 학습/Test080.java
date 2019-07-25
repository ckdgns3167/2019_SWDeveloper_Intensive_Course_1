package 코드와같이이해하는자바;

//package temp;
import java.io.*;

public class Test080 {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		InputStream in = new FileInputStream("C:\\A\\jdk-6u30-apidocs.zip");
		OutputStream out = new FileOutputStream("C:\\A\\b.zip");
		//복사 : dor *.dat로 확인하고 type b.dat 로 확인하고..
		//느린복사
		while (true) {
			int r = in.read();
			if (r == -1)
				break;
			out.write(r);
		}
		out.close();
		in.close();
	}

}
