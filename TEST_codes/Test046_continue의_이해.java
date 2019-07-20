public class Test046_continue의_이해 {
	public static void main( String[] args )
	{
		int[] i = new int[]{1,2,3,4};

		for( int j = 0 ; j < i.length ; j++ ) {
			if( j == 2 )
				continue;
			System.out.println( i[j] );
		}
	}
}
/*	break : 반복문을 탈출한다.
	continue : 반복문의 아래 코드는 수행을 건너뛰고 반복을 계속한다.
*/