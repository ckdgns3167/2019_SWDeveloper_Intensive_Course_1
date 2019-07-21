/*
	객체지향 언어의 3대 속성
	1. 상속성 : 클래스를 상속해서 클래스 만든다.
	2. 은닉성 : 감추고 싶은건 감출 수 있다.
	3. 다형성 : 하나의 심볼(이름)이 여러 실체에 매핑될 수 있다.
*/

class A {
	int apple = 10;
}

//	클래스 B 는 클래스 A 를 상속하여 만들어졌음을 명시함.
//		A 에서 선언한 멤버변수 멤버함수를 내려받겠다 ( 물려받겠다 ) ... 
class B extends A {
	int add( int i, int j ){ return 100; }
}

public class Test027_객체지향_3대_속성{
	public static void main( String[] args ){
		B t = new B();
		System.out.println( t.apple );
	}
}
//	Q. 에러 안나는 이유를 설명하시요 
//	3가지 : 참조형변수 선언. 인스턴스 생성. 상속받아 클래스 선언. 




