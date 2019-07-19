package 코드와같이이해하는자바;

class Temp3 {
	private Object data = 100;

	public Object getData() {
		return data;
	}

	public void setData(int data) {
		this.data = data;
	}
}

public class 게터세터 {

	public static void main(String[] args) {
		Temp3 t3 = new Temp3();
		// TODO Auto-generated method stub
		System.out.println(t3.getData());
		// 인스턴스 내의 변수값을 앍기전용으로 하려면 ? getter만 만들어준다.
		// 인스턴스 내의 변수값을 바끅고 싶을 때 setter를 쓰이는거 예외

	}

}
