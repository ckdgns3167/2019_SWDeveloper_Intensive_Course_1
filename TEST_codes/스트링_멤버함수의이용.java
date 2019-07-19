package 코드와같이이해하는자바;

public class 스트링_멤버함수의이용 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String l = "helloWorld";
		System.out.println(l.substring(2, 5));
		System.out.println(l.indexOf("or"));
		System.out.println(l.indexOf(""));
		System.out.println("".length());

		System.out.println(l.startsWith("hell"));
		System.out.println(l.endsWith("ld"));

		char[] ch = l.toCharArray();
		for (int i = 0; i < ch.length; i++) {
			System.out.println(ch[i]);
		}
	}

}
