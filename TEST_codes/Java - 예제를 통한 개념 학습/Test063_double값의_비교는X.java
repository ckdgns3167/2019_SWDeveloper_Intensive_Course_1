public class Test063_double값의_비교는X {
	public static void main( String[] args ) {
		boolean i = true;
		boolean j = false;

		System.out.println( 10 < 5 );
		System.out.println( 10 / 3 );	// 몫 ( 나머지 없음 )
		System.out.println( 10 % 3 );
		System.out.println( 10.0 / 3 );

		//	double 값은 정확하다고 할수 없기에 == 비교는 해서는 안된다.
		System.out.println( 3.3333 * 3 == 10.0 );

		//	비교연산은 boolean 값을 리턴 : == != > < >= <=
		//	거의 모든 연산은 같은 자료형 끼리 가능 : int / int = int
	}
}
//	C 는 정수값 0 은 false , 0 이 아닌 모든 정수는 true 
//	if( 100 )