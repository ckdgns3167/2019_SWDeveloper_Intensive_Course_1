package 코드와같이이해하는자바;

interface ICalc {// 이 안에 있는 모든 함수는 abstract한 클래스. 몽땅 추상
	public void print();
}

interface IUnknown {

}

class Applea {

}

// extends와 interface 동시에 적용 가능
//두개 이상의 인터페이스로부터 상속받아 다 구현시키는 것이 가능하다. 
class Calc extends Applea implements ICalc, IUnknown {// 이것도 상속받는 개념이 맞음.
	// 인터페이스 내에 있는 모든 추상 메서드를 모두 오버라이딩해야함.
	@Override
	public void print() {
		// TODO Auto-generated method stub
		System.out.println("A");
	}

}

public class 인터페이스예제 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ICalc ic = new Calc();
		// 인터페이스는 일종의 abstract 클래스이다. - 변수 선언, 상속당함 가능, 인스턴스 생성 불가(abstract 특성과 동일)
		ic.print();
	}

}
