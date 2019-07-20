interface IGreet {
	public String greet();
}

class MerciGreet implements IGreet {
	public String greet(){ return "Merci"; }
}

class HelloGreet implements IGreet {
	public String greet(){ return "Hello"; }
}

abstract class GreetDeco implements IGreet {
	protected IGreet ig = null;

	GreetDeco( IGreet i ){
		ig = i;
	}
}

//	자손의 생성자에서 조상의 생성자 중 매개변수 있는 생성자를 호출 원하면 super 로 지정.
class SharpDeco extends GreetDeco {
	SharpDeco( IGreet i ){
		super( i );
	}
	public String greet(){ return "#" + ig.greet()+ "#"; }
}

class StarDeco extends GreetDeco {
	StarDeco( IGreet i ){
		super( i );
	}
	public String greet(){ return "*" + ig.greet()+ "*"; }
}

public class Test039_interface의_예제 {
	public static void main( String[] args ) {
		IGreet ig = new StarDeco( new SharpDeco( new MerciGreet() ) );
		System.out.println( ig.greet() );
	}
}











