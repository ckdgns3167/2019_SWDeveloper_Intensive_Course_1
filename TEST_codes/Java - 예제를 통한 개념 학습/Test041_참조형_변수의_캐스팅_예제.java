class A{
	int i = 100;
}

class B extends A{
	int i = 200;
	void print(){}
}

public class Test041_참조형_변수의_캐스팅_예제 {
	public static void main( String[] args ) {
		A t = new B();
		System.out.println( t.i );

		//	t 포인터가 가리키는 인스턴스를 감싸는 B 클래스 인스턴스를 t2 가 가리킨다.
		B t2 = (B)t;
		t2.print();
		System.out.println( t2.i );
		// 조상의 멤버 변수를 자손에서 똑같은 이름으로 만들어서 사용하지 말아야하는 이유
		// 오류를 잡을 수 없음... 이걸 방지하기 위해 같은 이름으로 만들지 말고, 맴버변수를 필요로 한다면
		// 그 변수의 게터세터를 만들어서 하도록한다.
	}
}








