package 코드와같이이해하는자바;

interface ICalcc {
	public int execute(int i);
}

class AddCalc implements ICalcc {

	int data = 0;

	AddCalc(int j) {
		data = j;
	}

	@Override
	public int execute(int i) {
		// TODO Auto-generated method stub
		return i + data;
	}

}

//빼기를 할 때는 ** 를 붙여서 프린트 하라고 시키고 싶다.(예를 들면)
//일시적으로 시키고 싶은 경우가 있더라.

//옜날 프로그래머들은 빈 인터페이스를 이럴 때 이용했다...! 고급기술
interface PrintStars {
//쓰임당하는 쪽에서 쓰는 쪽에 어떤 용도로 써달라고 할때 절묘하게 쓰일 수 있다.
}

class MinusCalc implements ICalcc, PrintStars {

	int data = 0;

	MinusCalc(int j) {
		data = j;
	}

	@Override
	public int execute(int i) {
		// TODO Auto-generated method stub
		return i - data;
	}

}

public class 커맨드패턴예제 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ICalcc i = new AddCalc(3);

		int r = 5;
		r = i.execute(r);
		System.out.println(r);

		ICalcc[] ls = new ICalcc[5];
		ls[0] = new AddCalc(2);
		ls[1] = new MinusCalc(6);
		ls[2] = new AddCalc(3);
		ls[3] = new MinusCalc(7);
		ls[4] = new AddCalc(5);

		// 마치 메크로를 돌리는 것 같음...복잡한 업무처리나 논리처리를 딱 한번 만들어 놓고
		int y = 10;
		for (int l = 0; l < ls.length; l++) {
			y = ls[l].execute(y);
			if (ls[l] instanceof PrintStars) {
				System.out.print("**");
			}
			System.out.println(y);
		}
	}
	// 일반적으로 자료값은 변수로, 동작은 함수로 만든다.
	// 동작을 하나의 인스턴스로 수행하게 하는 경우가 있다.
	// -이런 설계 기법을 Command Pattern 이라고 한다.
}
