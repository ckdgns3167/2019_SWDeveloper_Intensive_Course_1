public class Test060_String의_멤버함수의_이용 {
    public static void main( String[] args ) {
		String l = "HelloWorld";
		System.out.println( l.substring(2,5) );

		//	문자열 안의 부분 문자열의 위치를 리턴 : 6
		System.out.println( l.indexOf("or") );

		//	없는 문자열을 찾을 경우에는 -1 을 리턴한다.
		System.out.println( l.indexOf("xx") );

		//	시작되는 단어를 비교한다. 
		System.out.println( l.startsWith("Hell") );

		//	끝나는 단어를 비교한다.
		System.out.println( l.endsWith("ld") );

		//	자료형의 배열을 리턴해 준다.
		char[] ch = l.toCharArray();
		for( int i = 0 ; i < ch.length ; i++ ){
			System.out.println( ch[i] );
		}
	}
}
