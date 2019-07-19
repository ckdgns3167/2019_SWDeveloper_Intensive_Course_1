package 코드와같이이해하는자바;

class Temp0 {
	int data = 0;

	// 아래코드의 t와 this 가 가리키는 대상은 같다..
	// 따라서 t.add(10) 은 10을 더한 후 에 t로 바꿔 쓸 수 있어진다.
	// StringBuffer 클래스의 append에서 볼 수 있다. 
	Temp0 add(int i) {
		data = data + i;
		return this;// 리턴을 this 로???? WoW
	}
}

public class 스트링버퍼_어팬드_테크닉 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Temp0 t = new Temp0();
		t.add(10).add(10).add(10).add(10).add(10);
		System.out.println(t.data);
	}

}
