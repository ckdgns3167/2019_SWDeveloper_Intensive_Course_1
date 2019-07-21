import java.util.*;

/*	Map 은 순서개념 없이 key=value 형태의 마치 사전과 같은 형태로 저장합니다.
	put 함수로 저장 , get 함수로 key 에 해당하는 value 를 뽑아낸다.

	List , Set , Map 형태로 뭔가를 저장하는 형태를 흔히 Collection 이라고 한다.
	- 각각의 중복 , 순서 여부를 정리하세요.
*/
public class Test070_Map의_예제 {
    public static void main( String[] args ) {
		Map<String,String> map = new Hashtable<String,String>();
		map.put("apple","사과");
		map.put("banana","바나나");
		map.put("orange","오렌지");
		map.put("kiwi","키위");
		map.put("apple","사과2");

		String value = map.get("kiwi");
		System.out.println( value );

		//	Iterator 는 표준 검색방법이다. keySet() 은 key 값만의 Set 을 생성한다.
		Set<String> keys = map.keySet();
		Iterator<String> it = keys.iterator();
		while( it.hasNext() ) {
			String l = it.next();
			String v = map.get( l );
			System.out.println( l + "," + v );
		}

		System.out.println( map.toString() );
	}
}
