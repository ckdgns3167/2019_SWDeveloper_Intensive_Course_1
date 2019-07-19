package 코드와같이이해하는자바;

public class 언박싱_오토박싱 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Integer i = 100;// 원래 같으면 말도안되는 문법임. 하지만... 버전업되면서 허용되는 것이 몇개 있음!
		Object t = true;
		System.out.println(i.getClass().getName());
		System.out.println(t.getClass().getName());

		int j = i;// 이것도 원래같으면 골때리는 문법인데...!!!!!! 언박싱이라고 부른다 이과정을!!!!!!!!!!!!!!!!!
		// 오브젝트 타입으로 오토박싱된 인스턴스는 언박싱이 불가!
		System.out.println(j);
	}
	// Integer i = 100; 는 컴파일러가 Integer i = new Integer(100); 로 자동 바꿈.
	// 값을 래퍼클래스에 대입하는 코드는 자동으로 인스턴스 생성해서 값을 감싸준다. 사용자의 편의를 고려한게 아닌가..
	// 오토박싱개념이다 이것이!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	// 내부적으로 자동으로 인스턴스가 생성되도록 되어 있다.
}

// Object t = true; 도 오토박싱으로 인스턴스가 생성된다. 
