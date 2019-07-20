interface ICalc {
	public void print();
}

interface IUnknown{}
class Apple {}

class Calc extends Apple implements ICalc , IUnknown{
	public void print(){ System.out.println("A"); }
}

public class Test038_interface의_개념 {
	public static void main( String[] args ) {
		ICalc ic = new Calc();
		ic.print();
	}
}
//	인터페이스에 선언된 method 는 몽땅 abstract 해야 한다.
//	인터페이스를 상속해서 클래스를 선언할때는 implements 를 이용해야 한다.
//	상속받은 클래스는 인터페이스에 선언된 메소드를 몽땅 오버라이딩 해야 한다.
//	인터페이스는 일종의 abstract 클래스이다. - 변수선언 , 상속당함 가능 , 인스턴스 생성 불가.
//	2개 이상의 인터페이스 상속? OK , 동시에 클래스 1개 상속? OK 



