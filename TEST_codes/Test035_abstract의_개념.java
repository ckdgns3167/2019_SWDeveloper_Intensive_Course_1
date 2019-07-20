abstract class A {
	abstract public void print();
}

abstract class B{}

class C extends B{}

public class Test035_abstract의_개념 {
	public static void main( String[] args ) {
		A t = null;
	}
}
/*	위의 print 함수는 선언되었지만 정의되지 않았다. 반드시 abstract 붙여준다.
	abstract 메소드를 하나라도 가진 클래스는 반드시 abstract 클래스라고 정의해야 한다.

	abstract class 는 인스턴스를 못만든다. 변수선언 , 상속은 가능하다.

*/








