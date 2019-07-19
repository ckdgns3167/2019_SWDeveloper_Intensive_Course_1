package 코드와같이이해하는자바;

class A {
	int apple = 10;
}

//클래스 B는 클래스 A를 상속하여 만들어졌음을 명시함.
//A에서 선언한 멤버변수 멤버함수를 내려받겠다. (물려받겠다.)
class B extends A {
	int add(int i, int j) {
		return 100;
	}
}

public class 상속성예제 {

	// 클래스를 선언해놓으면 할 수 있는 3가지 :
	// 참조형 변수 선언. 인스턴스를 생성, 상속받아 클래스 선언
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		B t = new B();
		System.out.println(t.add(1,2));
	}
	// Q. 에러 안나는 이유를 설명하시오 : extends를 통해 부모 클래스의 멤버 변수를 그대로 물려 받게 되는데, B의 인스턴스가 생성되면
	// B의 apple의 기억공간이 할당되고 이 인스턴스를 가리키는 참조형 변수를 통해 apple에 접근할 수 있게 되어 값을 뽑아낼 수 있다.

}
