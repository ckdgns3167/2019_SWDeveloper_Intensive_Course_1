package 코드와같이이해하는자바;

class Temp2 {
	int i = 100;

	static void print() {
//		System.out.println(i);
		// 에러가 나는 이유? 함수와 변수의 생성시점이 다르기 때문에 i를 이용하려고 보면 i가 아직 없기때문에 사용이 불가능!
	}
}

public class 스테틱의이용 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Temp2.print();
		// 스테틱 멤버는 클래스명.심볼 형태로 접근이 가능!
		// 인스턴스 생성전에 존재하기에 ..!
	}

}
