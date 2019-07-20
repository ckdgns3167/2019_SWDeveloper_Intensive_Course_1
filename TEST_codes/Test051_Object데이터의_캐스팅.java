class Temp {
	private Object data = null;
	public Object getData(){ return data; }
	public void setData( Object i ){ data = i; }
}

class Temp2 {
	private String data = null;
	public String getData(){ return data; }
	public void setData( String i ){ data = i; }
}

//	아래 코드에서 캐스팅이 필요한 경우와 필요하지 않은 경우를 구분한다.
//	모든 인스턴스를 저장 가능한 것은? 캐스팅 없이 꺼낼 수 있는 것은?

public class Test051_Object데이터의_캐스팅 {
	public static void main( String[] args ) {
		Temp2 t2 = new Temp2();
		t2.setData( "HelloWorld" );
		String l2 = t2.getData();

		Temp t = new Temp();
		t.setData( "HelloWorld" );
		String l = (String)t.getData();
	}
}
