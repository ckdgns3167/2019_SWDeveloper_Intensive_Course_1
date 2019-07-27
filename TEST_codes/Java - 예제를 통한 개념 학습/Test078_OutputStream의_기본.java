package temp;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class Test078_OutputStream의_기본 {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		OutputStream out = new FileOutputStream("a.dat");
		out.write(65);
		out.write(65);
		out.write(65);
		out.write(65);
		out.close();//실제로 쓰여질 때는 이때고 그전까지는 메모리에 저장되어있음.
	}
	/*
	 FileOutputStream : 파일에 저장하는 방법을 제공한다. 
	 OutputStream : 내보내는 방법을 추상화 한 클래스. 
	 (이걸 상속받은 클래스는, 이걸로 가리킬 수 있고, 이것에 선언된거만 쓴다.)
	 
	 write : 한번에 1 바이트를 내보내는데, 오버라이딩 된 write가 호출된다.
	 (api 보니까) , 오버라이딩 된 write는 매개변수의 값을 a.dat 파일에 저장하게 된다.
	 
	 out.close(); - 내보내는 통로를 닫고, 뒤 처리를 해 준다.
	 
	 class AppleOutputStream extends OutputStream...
	 형태로 선언되어졌다고 셈 치면, 인스턴스만 바꾸면 나머지는 바꿀 필요 없다. 
	 */

}
