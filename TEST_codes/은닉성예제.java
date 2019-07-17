package 코드와같이이해하는자바;

class Az {
	private int mayak = 0;
	protected int monarisa = 5;
	public int house = 10;
}

class Bz extends Az {
	void print() {
		// 아무리 상속으로 조상의 것을 물려받는다고 해도 private 변수는 물려받지 않음. private한 변수는 접근 불가능 함.
		System.out.println(house);
	}
}

public class 은닉성예제 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Az look = new Az();
		System.out.println(look.house);
		// 참조형 변수로도 접근이 불가능함 ...

		// protected 를 포수의 사인으로 이해하면 좋은데, 같은 팀의 다른 클래스에게는 알려지지만, 다른 팀에 소속된 클래스는 접근이
		// 불가해야한다.
		// 후배에게 물려줄 때는 당연히 접근 가능해야한다.
	}

}
