import java.lang.reflect.Method;

public class Test066_3_getMethods를_이용해_클래스의_특정_메서드의_포인터_추출 {
    public static void main( String[] args ) throws Exception
	{
        Class<?> cls = Class.forName("temp.Test066A");
		Object obj = cls.newInstance();
		/*
			Method 는 C 의 함수포인터의 역할을 한다.
			cls.getMethods() : 모든 멤버함수의 포인터를 넘긴다.
			cls.getMethod(...) : 단 하나의 멤버함수의 포인터를 넘긴다.
				... 에는 함수이름 , 매개변수의 형태를 명시한다.
		*/
		//	Method mtd = cls.getMethod( "print" );
		Method mtd = cls.getMethod( "print2" , int.class );
		System.out.println( mtd );

		Object r = mtd.invoke( obj, 20 );
		System.out.println( ((Integer)r).intValue() );
	}
}