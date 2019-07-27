import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class Test084_2_데코레이터_Object {

	public static void main(String[] args) throws IOException {
		/*
		데코레이터 패턴으로 이해하면 out 이 가리키는 대상은 
			FileOutputStream("d.dat") 에 저장하되 
			ObjectOutputStream 에서 제공하는 방법을 사용하게 된다.

		ObjectOutputStream 은 writeInt writeDouble writeUTF 등을 제공
		- 전송시에 안 깨진다. 
	*/
		ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream("d.txt"));
		out.writeInt(10101);
		out.writeUTF("오늘 저녁은 뭐를 먹냐??");
		out.writeInt(10102);
		out.writeInt(10103);
		out.close();

		ObjectInputStream in = new ObjectInputStream(new FileInputStream("d.txt"));
		int a = in.readInt();
		String l = in.readUTF();
		int b = in.readInt();
		int c = in.readInt();

		in.close();

		System.out.println(a);
		System.out.println(l);
		System.out.println(b);
		System.out.println(c);
	}

}
