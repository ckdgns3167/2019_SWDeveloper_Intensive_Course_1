class A {

}

class B extends A {
	public void print(){ System.out.println( 100 ); }
}

public class Test062_instanceof의_예제 {
	public static void main( String[] args ) {
		A t = new A();

		//	[참조형변수 instanceof 클래스명 ] : 참조형 변수가 클래스명으로 캐스팅이 가능한지 알아보는 방법
			//	(B)t 이것이 가능하면 true / 아니면 false 

		if( t instanceof B ) {
		//	t 가 가리키는 인스턴스를 감싸는 B 인스턴스 영역이 존재해야만 가능
			B t2 = (B)t;
			t2.print();
		}
	}
}