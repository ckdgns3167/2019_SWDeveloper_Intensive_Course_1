package 코드와같이이해하는자바;

class Temp4 {
	private Object data = null;

	public Object getData() {
		return data;
	}

	public void setData(Object i) {
		data = i;
	}
}

class Temp5 {
	private String data = null;

	public String getData() {
		return data;
	}

	public void setData(String i) {
		data = i;
	}
}

public class 오브젝트클래스캐스팅 {

	// 아래 코드에서 캐스팅이 필요한 경우와 필요하지 않은 경우를 구분한다.
	// 모든 인스턴스를 저장 가능한 것은 ? 캐스팅 없이 꺼낼 수 있는 것은?

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Temp5 t2 = new Temp5();
		t2.setData("hello");
		String l2 = t2.getData();

		Temp4 t = new Temp4();
		t.setData("hello");
		String l = (String) t.getData();
	}

}
