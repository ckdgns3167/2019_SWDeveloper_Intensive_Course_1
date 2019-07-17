package 코드와같이이해하는자바;

//자주 변할 수 있는 부분을 abstract로 해놓고 자주 안변하는 것은 실제로 코드를 짜 놓는다.
//그냥 상속받아 오버라이드만 해주면 다른코드는 다시 써줄 필요도 없이 그냥 쓸 수 있게된다. 

abstract class Bank {
	abstract public double calc(double money, int years, double rate);

	public void print() {
		double r = calc(100, 100, 0.066);
		System.out.println(r);
	}
}

class BokriBank extends Bank {

	@Override
	public double calc(double money, int years, double rate) {
		// TODO Auto-generated method stub
		return 59665.1234 * subCalc();
	}

	private int subCalc() {
		return 0;
	}
}

class danriBank extends Bank {

	@Override
	public double calc(double money, int years, double rate) {
		// TODO Auto-generated method stub
		return 760.0;
	}

}

public class 추상클래스예제_중요 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Bank b = new danriBank();// 인스턴스만 바꿔주자, 효율적 , 이 얼마나 편리한 세상인가...유지보수, 재활용
		b.print();
	}

}
