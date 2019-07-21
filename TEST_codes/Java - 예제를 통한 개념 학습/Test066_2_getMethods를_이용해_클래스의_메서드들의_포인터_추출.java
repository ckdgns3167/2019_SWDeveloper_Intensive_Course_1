import java.lang.reflect.Method;

public class Test066_2_getMethods를_이용해_클래스의_메서드들의_포인터_추출 {
    public static void main( String[] args ) throws Exception
	{
        Class<?> cls = Class.forName("temp.Test066A");
		Object obj = cls.newInstance();

		/*	getMethods() : 클래스 안에서 선언된 함수에 대한 포인터들을 추출한다.

		*/
		Method[] mtds = cls.getMethods();
		for( int i = 0 ; i < mtds.length ; i++ ) {
			System.out.println( mtds[i] );
		}
	}
}