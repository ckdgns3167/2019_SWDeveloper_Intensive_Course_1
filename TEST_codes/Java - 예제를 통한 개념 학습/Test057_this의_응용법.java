class Temp {
	int data = 0;

	//	아래코드의 t 와 this 가 가리키는 대상은 같다.
	//		따라서 t.add( 10 ) 은 10을 더한 후에 t 로 바꿔 쓸 수 있어진다.
	//		StringBuffer 의 append 에서 볼 수 있다.

	Temp add( int i ) {
		data = data + i;
		return this;
	}
}
public class Test057_this의_응용법 {
    public static void main( String[] args ) {
		Temp t = new Temp();
		t.add( 10 ).add( 10 ).add( 10 ).add( 10 ).add( 10 );
		System.out.println( t.data );
	}
}