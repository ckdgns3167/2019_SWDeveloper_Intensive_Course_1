class Temp {
	public void print(){ System.out.println(1); }
	public void print( int i ){}
	public void print( double i ){}
	public void print( int i, int j ){}
}
/*	하나의 클래스 안에 이름은 같은데 매개변수 형태가 틀린 함수가 여러개 공존가능
	- method overloading 이라고 한다.

	딱 매개변수가 맞지 않으면 가장 가깝게 자동 형변환 되는 것을 찾아서 호출한다.
*/
public class Test040_overloading_이해 {
	public static void main( String[] args ) {
		Temp t = new Temp();
		t.print();

		//	float j = 3.14;	이게 왜 안되는지 정리.
		//	float j = (float)3.14;	-- 가능하긴 하다 ...
		float j = 3.14F;
		t.print( j );
	}
}








