package 코드와같이이해하는자바;

public class 스트링 {
	// String : new 없이 ""로 인스턴스가 생성이 가능한 클래스
	// 참조형 변수의 비교는 동일한 인스턴스를 가리킬 때 true
	// 동일한 null도 true
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s = "Ad";
		String t = "Ad";
		System.out.println(s == t);// s와 t가 가리키고 있는 인스턴스가 하나가 되어 true를 출력하게됨.
		// 지금 인스턴스가 두개가 아니라 하나라는 인스턴스라는 말이됨
		// StringPool 이라는 독특한 java의 구조가 나온다.!!
		// 이거 때매 자바를 쓴다고 해도 과언이 아닐만큼 중요한 개념임
		// ""를 만나면 VM은 StringPool 을 뒤져서 없으면 만들고, 있으면 재활용
		// -이것은 웹 프로그래밍에 매우 유용한 점이다.
		// HTML 내용을 String으로 만들고 재활용하는 쪽이 메모리 관리에 유용하기 때문이다.

	}

}
