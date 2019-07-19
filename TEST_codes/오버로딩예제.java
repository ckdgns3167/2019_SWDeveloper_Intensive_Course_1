package 코드와같이이해하는자바;

class Temp {
	// 하나의 클래스 안에 같은 이름의 멤버함수를 선언할 수 있다. - 오버로딩
	// 조건으로 매개변수의 형태가 다 달라야 한다.
	public void print() {
		System.out.println(1);
	}

	public void print(int i) {
	}

	public void print(double i) {
	}
}

public class 오버로딩예제 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Temp p = new Temp();
		p.print();
		// 3.14는 double이고 왼쪽은 float라 타입이 달라서 곧바로 대입이 안된다.따라서 캐스팅이 필요하다.
		//3.14는 double이라 float보다 큰 개념이라 자동 캐스팅이 안된다.
		// 이 반대는 허용된다. 
		float h = 3.14f;
		float j = (float) 3.14;
		//대입을 하기 전에 양쪽의 타입을 비교하는데, 오른쪽 3.14는 실수형인데 자바에서는 실수형을 읽을 때 기본적으로 double타입으로 인식을 하도록 되어 있어서 만약 왼쪽 자료형이 float라면 타입이 매치가 되지않아서 오류가 뜬다
		//대입 되는 쪽이 작은 개념이라 큰 개념에서 작은 개념으로는 자동 캐스팅이 안된다.
		//오류를 제거해주려면 강제로 캐스팅을 해주면 된다.  
	}

}
