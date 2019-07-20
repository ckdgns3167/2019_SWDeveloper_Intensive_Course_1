public class Test058_StringBuffer의_append함수의_장점 {
    public static void main( String[] args ) {
		StringBuffer sb = new StringBuffer();
		sb.append("apple");
		sb.append("banana");

		String l = sb.toString();
		System.out.println( l );

		System.out.println( "apple" + "banana" );
	}
}
//	"apple" + "banana" 는 컴파일러가 new StringBuffer().append("apple")
//		.append("banana").toString();
/*
		아래 코드는 한 줄마다 new StringBuffer() 가 동작해야 한다.
		헌데 위의 main 의 예제는 하나의 StringBuffer 만 사용한다.
		: 메인 함수의 코드가 메모리 효율상 훨씬 좋다.

		String l = ""
		l = l + "*";
		l = l + "*";
		l = l + "*";
		....

*/