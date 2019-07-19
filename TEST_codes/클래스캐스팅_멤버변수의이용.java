//package 코드와같이이해하는자바;
//
//class AAA {
//	int i = 100;
//}
//
//class BBB extends AAA {
//	int i = 200;
//}
//
//public class 클래스캐스팅_멤버변수의이용 {
//
//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//		AAA z = new BBB();
//		System.out.println(z.i);
//
//		// z포인터가 가리키는 인스턴스를 감싸는 BBB클래스 인스턴스를 z2가 가리킨다.
//		BBB z2 = (BBB) z;
//		// 조상의 멤버 변수를 자손에서 똑같은 이름으로 만들어서 사용하지 말아야하는 이유
//		// 오류를 잡을 수 없음 절대 .. 이걸 방지하기 위해 같은이름으로 만들지 말고 맴버변수를 필요로 한다면
//		// 그 변수의 게터세터를 만들어서 하도록한다.
//		System.out.println(z.i);
//	}
//
//}
