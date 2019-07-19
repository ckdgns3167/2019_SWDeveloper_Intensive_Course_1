package 코드와같이이해하는자바;

interface IGreet {
	public String greet();
}

class MerciGreet implements IGreet {

	@Override
	public String greet() {
		// TODO Auto-generated method stub
		return "Merci";
	}
}

class HelloGreet implements IGreet {

	@Override
	public String greet() {
		// TODO Auto-generated method stub
		return "Hello";
	}
}

abstract class GreetDeco implements IGreet {
	protected IGreet ig = null;

	GreetDeco(IGreet i) {
		ig = i;
	}
	// abstract를 써줌으로써 오류가 잡혔다. 상속받은 함수가 추상 메서드라서 !
}

// 자손의 생성자에서 조상의 생성자 중 매개변수 있는 생성자를 호출 원하면 super로 지정.
class SharpDeco extends GreetDeco {
	SharpDeco(IGreet i) {
		super(i);
	}

	public String greet() {
		return "#" + ig.greet() + "#";
	}
}

class StarDeco extends GreetDeco {
	StarDeco(IGreet i) {
		super(i);
	}

	public String greet() {
		return "*" + ig.greet() + "*";
	}
}

public class 인터페이스예제2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		IGreet ig = new SharpDeco(new StarDeco(new HelloGreet()));
		System.out.println(ig.greet());
	}

}
