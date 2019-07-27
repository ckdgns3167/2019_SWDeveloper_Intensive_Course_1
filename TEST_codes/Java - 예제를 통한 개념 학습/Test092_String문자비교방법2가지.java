
public class Test092_String문자비교방법2가지 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String l = "HelloWorld";
		String r = "HelloWorld";
		String t = l.substring(2, 5);

		System.out.println(l == r);//true : 같은 String pool에 있기떄문에 == 으로 같은거 볼 수 있음.
		System.out.println("llo" == t);//false -> equals로 가능
		
		/*
		 정리
		 ""로 생성한 String은 Pool을 쓴다. 포인터비교가 가능.
		 그 이외의 경우 (substring 등등) 은 pool을 쓴다는 보장이 없다.
		 - 그 때는 equals로 비교한다.
		 */
	}

}
