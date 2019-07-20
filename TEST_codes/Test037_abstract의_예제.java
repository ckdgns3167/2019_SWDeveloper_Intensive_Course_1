abstract class Bank {
	abstract public double calc( double money, int years, double rate );
	public void print() {
		double r = calc( 100.0, 100, 0.066 );
		System.out.println( r );
	}
}

class BokriBank extends Bank {
	public double calc( double money, int years, double rate ){
		return 59665.1234 * subCalc() ;
	}

	private int subCalc(){ return 0; }
}

class DanriBank extends Bank {
	public double calc( double money, int years, double rate ){
		return 660.0 + money();
	}

	private int money(){ return 100; }
}

public class Test037_abstract의_예제 {
	public static void main( String[] args ) {
		Bank vk = new BokriBank();
		vk.print();
	}
}
/*

*/








