class Temp {
	private int data = 100;
	public int getData(){ return data; }
	public void setData( int i ){ data = i; }
}

public class Test049_getterSetter의_이용 {
	public static void main( String[] args ) {
		Temp t =  new Temp();
		t.setData( 200 );
		System.out.println( t.getData() );
	}
}
//	멤버변수는 private 권장 . 값을 읽을 때는 getter 함수를 제작해 쓴다.
//	인스턴스 내의 변수값을 읽기전용으로 하려면? getter 만 만들어 준다.
//	인스턴스 내의 변수값을 바꾸고 싶을때는 setter 를 쓰는것이 예의!