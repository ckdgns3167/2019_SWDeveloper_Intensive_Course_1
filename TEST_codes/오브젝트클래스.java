package 코드와같이이해하는자바;

class Temp1 {

}

public class 오브젝트클래스 {
	// 조상클래스를 지정하지 않으면 Object 로 부터 상속받는다.
	// java에서는 기본적으로 제공되는 클래스들이 많은데...
	// java.lang 패키지에 소속된 클래스는 import없이 사용 가능하다.
	// 가장 기본적인 클래스 모음, 막 가져다 써도 된단 얘기
	public static void main(String[] args) {
		// Object는 모든 클래스의 조상이 된다 ? YES
		// Object 형 변수는 어떤 인스턴스라도 가리킬 수 있다.
		Object a = new Temp1();

		// toString()은 Object에 선언되었고, 상속되었다.
		// 코드와같이이해하는자바.Temp1@7852e922 : 클래스명@해시코드값 - 인스턴스가 다르면 숫자값 다름.
		System.out.println(a.toString());
	}

}
