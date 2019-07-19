package 코드와같이이해하는자바;

class Temp6<T extends Object> {
	private T data = null;

	public T getData() {
		return data;
	}

	public void setData(T i) {
		data = i;
	}
}

// 제네릭 :인스턴스의 자료형을 동적으로 결정할 수 있다.
// <>안에 지정 가능한 타입은 참조형 변수 타입이어야 한다. (자료형 안됨)
// C++의 템플레이트 ... 가 이거랑 같다 c++은 자료형도 <>안에 허용
public class 제네릭예제 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Temp6<Object> t2 = new Temp6<Object>();
		t2.setData("hello");
		String l2 = (String) t2.getData();

		Temp6<Object> t = new Temp6<Object>();
		t.setData("hello");
		String l = (String) t.getData();
	}

}
