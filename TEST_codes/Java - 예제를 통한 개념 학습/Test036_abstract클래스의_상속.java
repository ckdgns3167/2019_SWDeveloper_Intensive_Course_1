abstract class A {
	abstract public void print();
}

class B extends A {
	public void print(){
		System.out.println( 100 );
	}
}

public class Test036_abstract클래스의_상속 {
	public static void main( String[] args ) {
		A t = new B();
		t.print();
	}
}
/*	abstract 메소드를 오버라이딩 하면 abstract 성질이 없어지게 된다.
	A t ? new B()? A t = new B() ? t.print()?
	- 이게 왜 문법적으로 가능한지를 점검할 필요가 있다.
*/








