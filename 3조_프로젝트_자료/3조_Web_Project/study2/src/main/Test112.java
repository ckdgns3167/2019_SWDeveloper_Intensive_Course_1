package main;

public class Test112 {
	// ���� �Ķ���� �Լ� ���� ���... 0..*
	// ���� String...�� String[]�� �����ϴ�.
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

	// Object arg_1 = 100; => 100�� new Integer(100)�� �ڵ���ȯ ����ڽ�
	// Object arg_2 = 3.14; => 3.14�� new Doublce(3.14)�� �ڵ���ȯ
	// Object arg_2 = null;
	public static void main(String[] args) {
		test2(100, "", 3.14, null);

		test("apple");
		test();
		test("apple", "banana");

	}
	/*
	 * [ ���亹�� ] 
	 * Object i = 100(O) ���� �ڽ� 
	 * int j = i (X)
	 * 
	 * Integer i = 100(O) �� �ڽ� 
	 * int j = i (O)
	 */

}
