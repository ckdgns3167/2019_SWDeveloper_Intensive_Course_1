package 코드와같이이해하는자바;

class Apple2 {
	int data = 0;// property

	int add(int i, int j) {// method
		return i + j;
	}
}

public class 클래스인스턴스참조형변수 {
	public static void main(String[] args) {
		// 인스턴스는 클래스라는 설계도를 보고 실체화된 것.
		// 참조형 변수는 이 인스턴스를 가리킬 수 있는 것.
		// 이 참조형 변수를 통해 인스턴스의 정보에 접근할 수 있음.
		Apple2 a = new Apple2();
		int i = a.add(10, 20);
		System.out.println(i);
	}
}
