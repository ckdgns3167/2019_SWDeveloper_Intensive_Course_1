package 코드와같이이해하는자바;

public class Test043_static의_이해3 {
	static {
		System.out.println("loaded");
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//클래스를 찾아내서 해당 클래스를 강제로 메모리에 로딩시킨다.
		// 로딩시키는 클래스의 static initializer가 동작한다.
//		Class.forName("");
	}

}
