class A {
	private int mayak = 0;
	protected int monarisa = 0;
	public int house2 = 0;
}

class B extends A {
	void print() {
		System.out.println( house2 );
	}
}

public class Test033_protected의_개념 {
	public static void main( String[] args ) {
		A look = new A();
		System.out.println( look.house2 );
	}
}
/*	look.monarisa 은 같은 패키지에서는 접근 가능. 다른 패키지에서는 접근 불가.

	protected 를 포수의 사인으로 이해하면 좋다.
	같은 팀의 다른 클래스에게는 알려지지만 , 다른 팀에 소속된 클래스는 접근 불가해야 한다.
	후배에게 물려줄때는 당연히 접근 가능해야 한다.

	( 실전에서는 private / public 많이 쓴다 )
*/








