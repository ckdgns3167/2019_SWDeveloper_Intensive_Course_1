import java.io.*;

public class Test089_파일존재여부확인 {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		File f = new File("Test089.java");
		boolean b = f.exists();
		System.out.println(b);
		if (b) {
			// 파일의 길이를 리턴한다.(long 자료에 주의)
			System.out.println(f.length());
		}
	}

}
