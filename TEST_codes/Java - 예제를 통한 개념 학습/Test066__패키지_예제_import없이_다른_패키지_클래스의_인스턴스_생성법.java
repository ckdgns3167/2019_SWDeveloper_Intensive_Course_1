public class Test066__패키지_예제_import없이_다른_패키지_클래스의_인스턴스_생성법 {
    public static void main( String[] args ) throws Exception
	{
		//	클래스를 찾아내서 해당 클래스를 강제로 메모리에 로딩시킨다.
		//		로딩시키는 클래스의 static initializer 가 동작한다.
        Class<?> cls = Class.forName("temp.Test066A");

		/*	Class : 로딩된 클래스의 관리자 역할을 한다.
			cls.newInstance() : cls 가 관리하는 temp.Test066A 의 인스턴스를 생성한다.

			obj.getClass().getName() : obj 가 가리키는 인스턴스를 생성시킨 클래스 명

			: import 없이도 다른 패키지의 클래스의 인스턴스를 생성할 수 있다.
		*/

		Object obj = cls.newInstance();
		System.out.println( obj.getClass().getName() );
    }
}