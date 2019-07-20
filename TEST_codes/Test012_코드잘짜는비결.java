public class Test012_코드잘짜는비결 {
	public static void main( String args[] ) {
		double total = 0;
		for( int j = 100 ; j > 0 ; j-- ) {
			double money = 100;
			for( int i = 0 ; i < j ; i++ ) {
				money = money + money * 0.066;
			}
			total = total + money;
		}
		System.out.println( total );
	}
}
/*
	코드 잘 짜는 비결 : 잘 쪼개서 짠다. 자신의 보폭을 잘 파악해야 한다.
	반복문이 정리가 되려면 일단 늘어놓고 - 정리한다. 
*/









