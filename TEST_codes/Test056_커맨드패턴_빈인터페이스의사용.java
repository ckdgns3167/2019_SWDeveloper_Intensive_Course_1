interface ICalc {
	public int execute( int i );
}

class AddCalc implements ICalc , PrintStars {
	private int data = 0;
	AddCalc( int j ) {
		data = j;
	}
	public int execute( int i ){
		return ( i + data );
	}
}

/*	빼기를 할 때는 ** 를 붙여서 프린트 하라고 시키고 싶다.
	일시적으로 시키고 싶은 경우가 있더라.

	옛날 프로그래머들은 빈 인터페이스를 이럴 때 이용했다.

	쓰임 당하는 입장에서 쓰는 쪽에게 어떤 의견을 제시하는 통로가 필요할때 
	아래의 빈 인터페이스를 이용하면 상당히 괜찮다.
	이것을 체계화 한 것이 1.5 이후에 도입된 Annotation 개념이 된다.
*/

interface PrintStars{}

class MinusCalc implements ICalc {
	private int data = 0;
	MinusCalc( int j ) {
		data = j;
	}
	public int execute( int i ){
		return ( i - data );
	}
}

public class Test056_커맨드패턴_빈인터페이스의사용 {
    public static void main( String[] args ) {
		ICalc i = new AddCalc( 3 );

		int r = 5;
		r = i.execute( r );
		System.out.println( r );

		ICalc[] ls = new ICalc[5];
		ls[0] = new AddCalc( 2 );
		ls[1] = new MinusCalc( 6 );
		ls[2] = new AddCalc( 3 );
		ls[3] = new AddCalc( 7 );
		ls[4] = new MinusCalc( 5 );

		int y = 10;
		for( int l = 0 ; l < ls.length ; l++ ) {
			y = ls[l].execute( y );

			if( ls[l] instanceof PrintStars ) {
				System.out.print( "**" );
			}
			System.out.println( y );
		}
    }
}
/*	일반적으로 자료값은 변수로 , 동작은 함수로 만든다.

	동작을 하나의 인스턴스로 수행하게 하는 경우가 있다.
	- 이런 설계기법을 Command Pattern 이라고 한다.
*/