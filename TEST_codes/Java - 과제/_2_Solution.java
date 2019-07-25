package 제주과제2;

public class _2_Solution {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		double money = 0;
		for (int i = 1; i <= 100; i++) {// 백년동안
			money +=1000000;
			money = money + interestCalc(money, 6.6);
		}
		System.out.println(money);
	}

	public static double interestCalc(double money, double interest) {
		return money * (interest / 100);
	}

}
