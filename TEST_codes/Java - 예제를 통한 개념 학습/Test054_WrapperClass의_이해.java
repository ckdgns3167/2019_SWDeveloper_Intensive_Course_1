/*	Wrapper Class : 자료형 값을 감싸주는 가벼운 클래스 .
	int -> Integer 라는 클래스가 있음
	double -> Double 이라는 클래스 있음
*/

public class Test054_WrapperClass의_이해 {
	public static void main( String[] args ) {
		Object ob = new Integer(100);
		Object ob2 = new Double(3.14);

		int i = ((Integer)ob).intValue();
		System.out.println( i );

		double j = ((Double)ob2).doubleValue();
		System.out.println( j );
	}
}
