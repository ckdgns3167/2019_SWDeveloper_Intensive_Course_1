package 코드와같이이해하는자바;

public class 배열 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Integer[] i = new Integer[] { 1, 2, 3, 4 };
		System.out.println(i[0]);
		System.out.println(i[1]);
		System.out.println(i[2]);
		System.out.println(i[3]);
		System.out.println(i.length);

	}
	// 배열 : 동일한 형태의 기억장소가 연속으로 할당된 기억공간
	// new 를 써서 배열이 생성된 것인데, 자바의 특징으로 자바의 배열은 인스턴스이다.
	// 참조형 변수로 인스턴스인 배열을 가리키게 된다.
	// 해서 멤버변수와 멤버함수를 갖는다.

}
