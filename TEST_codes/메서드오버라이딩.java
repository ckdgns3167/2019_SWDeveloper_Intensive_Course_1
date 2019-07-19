package 코드와같이이해하는자바;

class AAZ {
	void print() {
		System.out.println("A print");
	}
}

class BBZ extends AAZ {
	void print() {
		System.out.println("B print");

		// 물려받은 자손쪽에서 물려받은 함수를 호출하고 싶을 때, super를 이용한다.
		super.print();
	}
	// 메서드 오버라이딩 : 조상에서 선언한 멤버함수를 자손에서 다시 선언할 수 있다.(재정의)
}

public class 메서드오버라이딩 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BBZ za = new BBZ();
		za.print();

		AAZ az = new AAZ();
		az.print();
	}

	// 상속 ? 자손의 인스턴스가 생성하는 과정에서 조상의 생성자가 호출된다. 그리고 조상의 멤버 변수, 함수를 내려받는다.

}
