package 코드와같이이해하는자바;

public class 스트링버퍼의효율을확인 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		StringBuffer l = new StringBuffer();
		for(int i = 0; i < 100;i++) {
			l.append("apple");
		}
		System.out.println(l.toString());
	}
//java -verbosegc 클래스이름 : 메모리가 부족할 때 메모리를 비우고 확보하는 일을 모니터링하게 된다.
/*
 	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String l = "";
		for(int i = 0; i < 100000;i++) {
			l = l + "apple";
		}
		System.out.println(l);
	}
 */

}
