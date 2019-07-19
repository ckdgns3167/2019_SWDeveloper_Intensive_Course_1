package 코드와같이이해하는자바;

public class 스트링버퍼_어팬드에대해 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		StringBuffer sb = new StringBuffer();
		sb.append("apple");
		sb.append("banana");

		String l = sb.toString();
		System.out.println(l);

		System.out.println("apple" + "banana");
	}
//"apple" + "banana" 는 컴파일러가 new StringBuffer().append("apple").append("banana").toString();


	//아래 코드는 한 줄 마다 new StringBuffer() 가 동작해야 해서 비효율적이다.
	// 헌데 위의 main 의 예제는 하나의 StringBuffer만 생성되고 일을 처리하기 때문에 메모리 효율이 좋다.
	//직관성은 떨아지지만 효율은 좋다!!!!!
	/*
	 String l = ""
	 l = l + "*";
	 l = l + "*";
	 l = l + "*";
	 ....
	 l = l + "*";
	 */


}
