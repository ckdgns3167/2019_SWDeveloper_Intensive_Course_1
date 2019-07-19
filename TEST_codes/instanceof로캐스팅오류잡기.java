package 코드와같이이해하는자바;

class Aaaa {

}

class Bbbb extends Aaaa {
	public void print() {
		System.out.println(100);
	}
}

public class instanceof로캐스팅오류잡기 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Aaaa t = new Aaaa();
		// [참조형 변수 instanceof 클래스명] : 참조형 변수가 클래스명으로 캐스팅이 가능한지 알아보는 방법
		// (Bbbb) t 이것이 가능하면 true 아니면 false
		if (t instanceof Bbbb) {
			Bbbb a = (Bbbb) t;
			a.print();
		}
		// t가 가리키는 인스턴스를 감싸는 B 인스턴스 영역이 존재해야만 가능

	}

}
