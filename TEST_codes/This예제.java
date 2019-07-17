package 코드와같이이해하는자바;

class Apple {
	int data = 0;

	int add1(int i, int j) {
		return 100;
	}

	// 리턴 타입이 없는 함수,
	void print() {// 안에 내용을 포인팅하고 있음.
		// this는 쉽게 말하면 멤버함수 안에서 자기 자신에 대한 참조형 변수.(깊은 이해가 필요)
		// 왜 필요한지, 굳이 왜 있어야 하는건지, 더 깊은 이해를 해보자
		System.out.println(this.data);// 이 print함수가 소속된 인스턴스를 가리키게 된다.
	}
}

public class This예제 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Apple t = new Apple();
		t.data = 10;
		t.print();

		Apple l = new Apple();
		l.data = 20;
		l.print();
	}

}
