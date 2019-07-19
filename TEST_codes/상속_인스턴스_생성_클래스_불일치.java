package 코드와같이이해하는자바;

class ADA {
	int i = 100;

	void print() {
		System.out.println("A print");
	}
}

class ZDA extends ADA {
	int i = 200;

	void print2() {
		System.out.println("B print2");
	}

	void print() {
		System.out.println("B print");
	}
}

public class 상속_인스턴스_생성_클래스_불일치 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ADA zda = new ZDA();// 오른쪽 인스턴스가 생성될 때는 조상, 자손의 함수가 모두 존재는 하지만 자손의 함수는 호출 불가능!!!!!!!!!
		zda.print();// 조상꺼만 호출가능함.
//		zda.print2();// 자손의 함수는 호출이 불가능
		// 하지만 자손에서 조상의 것을 재정의 하면 재정의한 것을 호출한다.(중요)

		System.out.println(zda.i);// 조상의 멤버 변수가 출력됨. 같은 i를 재정의 했지만 함수처럼 재정의한 값이 출력되는 것이 아니라 조상의 것이 출력됨!!
	}

	// 조상 타입의 변수로 자손의 인스턴스를 가리킬 수 있다.
	//

}
