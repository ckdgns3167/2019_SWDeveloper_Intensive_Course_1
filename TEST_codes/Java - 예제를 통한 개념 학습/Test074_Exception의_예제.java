
class TempException extends RuntimeException{}
/*
	java 에서 각종 에러는 class 로 구현된다. 
		extends Exception , extends RuntimeException

	코드 수행시 에러가 발생되면 해당 예외 클래스의 인스턴스를 throw 한다.
	발생된 예외를 적절하게 처리하지 못하면 프로그램은 종료한다.

	"예외는 함수 수행시에 발생되고 , 함수에 그 사실을 명시한다."
*/
public class Test074_Exception의_예제 {
    public static void main( String[] args ) {
		int i = 0;
		if( i == 0 ) {
			throw new TempException();
		}
		System.out.println( 0 );
	}
}
