public class Test045_배열_기본 {
	public static void main( String[] args )
	{
		int[] i = new int[]{1,2,3,4};

		System.out.println( i[0] );
		System.out.println( i[1] );
		System.out.println( i[2] );
		System.out.println( i[3] );
		System.out.println( i.length );

		//	이 코드는 외운다.
		for( int j = 0 ; j < i.length ; j++ ) {
			System.out.println( i[j] );
		}
	}
}
/*	배열 : 동일한 형태의 기억장소가 연속으로 할당된 기억공간.
		자바의 배열은 인스턴스다. i 는 참조형변수다.
		i.length 는 배열의 멤버변수이고 길이를 의미한다.

	int[] i = {1,2,3,4}; 도 가능. 헌데 이건 new int[] 가 생략된 형태.
*/