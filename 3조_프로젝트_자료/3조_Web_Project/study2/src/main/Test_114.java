package main;

interface ITemp {
	public void print();
}

public class Test_114 {

	public static void main(String[] args) {
		/*
		 * Anonymous class : 이름 없는 클래스 (조상은 있다. : ITemp)
		 * "ITemp를 상속받고 - 그러면 모든 메소드 오버라이딩 해주고..."
		 * 
		 * 이름이 없어서 재사용은 불가능하다. - 클래스 선언하고, 인스턴스 생성하고 끝... t 가 왜 가리킬 수 있는거지? (A t = new
		 * B();)
		 */
		// final로 선언된 로컬 변수는 어나니머스 클래스 안에서 사용 가능하다(그냥 외우기)
		// 절대 이해하려고 하지말고 외우기... 객체지향 개념 다 버린다.
		final int i = 100;
		ITemp t = new ITemp() {// 기괴한 구조... 이건 무엇일까..?
			public void print() {
				System.out.println("HelloWorld" + i);
			}
		};
		t.print();
	}

}
