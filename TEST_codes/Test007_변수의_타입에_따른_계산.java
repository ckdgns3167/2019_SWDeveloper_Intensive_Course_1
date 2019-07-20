public class Test007_변수의_타입에_따른_계산 {
	public static void main( String args[] ) {
		double j = 10.0;
		System.out.println( j );
		System.out.println( j + 10 );
		System.out.println( (int)j + 10 );
	}
}/*	byte < short < int < long < float < double
	작은 타입에서 큰 타입은 자동 변환 되지만
	큰타입에서 작은타입은 강제변환 없으면 에러난다.
	
	'기본적으로 같은 타입형 변수만이 연산가능하다'
*/
