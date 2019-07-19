package 코드와같이이해하는자바;

class AA {
	AA() {
		System.out.println("A constructor");
	}
}

class BB extends AA {
	BB() {
		System.out.println("B constructor");
	}
}

public class 조상과자손의생성자 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new BB();// 왜 A클래스에 있는 생성자가 호출되는 것일까?
		// 어떻게 이해하는 것이 좋을까? 조상의 생성자부터 쭈욱 먼저 호출됨..
		// 생성자는 상속되는 것이 아니고 단지 호출될 뿐이다.
		// 멤버변수, 함수만 상속된다.

		// 정리 : 자손의 인스턴스를 생성하면 조상의 생성자가 먼저 호출되고 자손의 생성자가 호출된다.
		// 생성자는 상속되지 않고, 다만 호출될 뿐이다. 멤버함수도 아니다.
		// 멤버함수는 참조형 변수로 호출이 가능한데, 생성자같은 경우는 호출이 불가능하다.
		// 그래서 멤버함수가 아니라고 할 수 있다.
		// 조상의 인스턴스가 생성되는 것은 아니다. 이유는 ?
	}

}
