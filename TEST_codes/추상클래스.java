package 코드와같이이해하는자바;

abstract class AZd {
	// 선언은 되었지만 내용은 정의 되지 않음. abstract
	// 이런 함수를 하나라도 가지고 있는 클래스라면 class 앞에 반드시 abstract 써야함
	// 이렇게 선언된 클래스는 인스턴스로 만들어질 수 없는 클래스다. new를 통해 생성하려고 하면 오류가 난다.
	// 그러면 변수 선언은 되나?? AZD a = null; 이것은 문제가 없다
	// 변수 선언(참조형 변수로), 상속은 가능하다.

	// 근데 왜 이게 왜 필요한 것인가..?
	abstract public void print();
}

abstract class Azdg {

}

class C extends AZd {
	public void print() {// 추상클래스를 상속받았는데 C클래스 앞에 abstract를 안하면 오류지만 만약 추상클래스의 추상메서드를 재정의 하면 abstract를
							// 안붙여도 오류가 안난다.
		System.out.println(100);
	}
}

public class 추상클래스 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AZd t = new C();
		t.print();// 자손의 재정의 함수가 호출 가능!
	}

}
