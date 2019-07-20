//	연료 고갈이라는 에러를 클래스로 명시함.
class FuelException extends Exception {
	public void solve(){
		System.out.println( "견인차를 불러라" );
	}
}

/*	Exception 이 깐깐하다 : 컴파일이 안된다 ... 
	- 함수에서 에러가 발생할 수 있다면 그 사실을 선언부에 명시해야 컴파일 된다.

*/
public class Test075_Exception의_예제 {

	public void carDrive( int fuel ) throws FuelException {
		if( fuel == 0 ){
			throw new FuelException();
		}
		System.out.println( "GOGO" );
	}

    public static void main( String[] args ) {

		Test075 t = new Test075();

		try {
			t.carDrive( 0 );
		}
		catch( FuelException e ){
			e.solve();
			System.out.println( "견인차를 불러라" );
		}
	}
}
/*
	throws FuelException 으로 선언된 함수를 호출할때는 
	반드시 에러가 발생할 수 있는 영역을 try { ... } 로 감싸준다.

	try 에는 반드시 1개 이상의 catch 가 있어야 한다.
	에러가 발생되며 에러 인스턴스를 throw 한다

	catch( FuelException e ) 에 있는 e 변수가 발생된 에러 인스턴스를 가리킬 수 있으면
	catch 에 딸린 { ... } 영역이 동작한다.
	... 에는 에러를 수습할 수 있는 코드가 들어가는 것이 바람직하다.

	catch( Exception e ) 을 써도 되는가? OK
*/