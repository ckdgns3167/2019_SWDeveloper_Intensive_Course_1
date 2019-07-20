class Temp {
	private Object data = null;
	public Object getData(){ return data; }
	public void setData( Object i ){ data = i; }
}

/*	String : new 없이 "" 로 인스턴스가 생성이 가능한 클래스
	참조형 변수의 비교는 동일한 인스턴스를 가리킬때 true ( 동일한 null 도 true )

	l == t 이 true 가 나온다? l 과 t 는 동일한 인스턴스를 가리킨다.
		( 아래코드의 String 인스턴스는 1개 이다 )
	StringPool 이라는 독특한 java 의 구조가 나온다.

	"" 를 만나면 VM은 StringPool 을 뒤져서 없으면 만들고 , 있으면 재활용
	- 웹 프로그래밍에 매우 유용하다. HTML 내용을 String 으로 만들고
		재활용하는 쪽이 메모리 관리에 유용하다.
*/
public class Test050_String과_StringPool의_이해 {
	public static void main( String[] args ) {
		String l = "HelloWorld";
		String t = "HelloWorld";
		System.out.println( l == t );

		Object o = "HelloWorld";
		String r = (String)o;
	}
}
