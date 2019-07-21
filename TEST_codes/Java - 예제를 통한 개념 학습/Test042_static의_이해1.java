class Temp {
	static int i = 100;
}

public class Test042_static의_이해1 {
	public static void main( String[] args ) {
		int j = Temp.i;		
	}
}
/*	자바 실행환경은 클래스가 필요해지면 .class 파일을 메모리에 올린다.
		그 후에 인스턴스 생성이 가능하다.

	static 멤버는 클래스 로딩시에 메모리를 할당받는다. 무조건 유일하다.
		( 인스턴스가 몇개이건 간에 )
	non-static 멤버는 인스턴스가 생성될때. 인스턴스마다 따로 따로 존재.
*/