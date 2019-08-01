package main;

public class Test112 {
	// 가변 파라미터 함수 선언 방법... 0..*
	// 실은 String...은 String[]과 동일하다.
	//
	public static void test(String... args) {

	}

	public static void test2(Object... args) {
		for (int i = 0; i < args.length; i++) {
			if (args[i] == null) {
				System.out.println("null");
			} else if (args[i] instanceof Integer) {
				int r = ((Integer) args[i]).intValue();
				System.out.println(r + 1);
			} else if (args[i] instanceof Double) {
				double r = ((Double) args[i]).doubleValue();
				System.out.println(r + 0.1);
			} else if (args[i] instanceof String) {
				System.out.println((String) args[i]);
			}
		}
	}

	// Object arg_1 = 100; => 100을 new Integer(100)로 자동변환 오토박싱
	// Object arg_2 = 3.14; => 3.14를 new Doublce(3.14)로 자동변환
	// Object arg_2 = null;
	public static void main(String[] args) {
		test2(100, "", 3.14, null);

		test("apple");
		test();
		test("apple", "banana");

	}
	/*
	 * [ 개념복습 ] 
	 * Object i = 100(O) 오토 박싱 
	 * int j = i (X)
	 * 
	 * Integer i = 100(O) 언 박싱 
	 * int j = i (O)
	 */

}
