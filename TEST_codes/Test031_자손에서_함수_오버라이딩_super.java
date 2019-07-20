class A {
	void print(){ System.out.println("A print"); }
}

class B extends A {
	void print(){
		System.out.println("B print");

		// 물려받은 자손쪽에서 물려받은 함수를 호출하고 싶을때 super 를 이용한다.
		super.print();
	}
}

public class Test031_자손에서_함수_오버라이딩_super {
	public static void main( String[] args ) {
		B t = new B();
		t.print();

		A t2 = new A();
		t2.print();
	}
}
/* 	method overridding : 조상에서 선언한 멤버함수를 자손에서 다시 선언할 수 있다.
	: 자손의 인스턴스의 print 를 호출되면 ( 조상? 자손? ) 자손!

	상속? 생성자? 자손에서 물려받은 함수 재 선언? 그러면 조상에서 선언된 함수는 못씀?
	N0! super. 참조형 변수를 통해 호출가능!
*/



