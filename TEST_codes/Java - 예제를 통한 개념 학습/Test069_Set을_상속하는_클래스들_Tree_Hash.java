import java.util.*;
/*
	Set 인터페이스를 상속받은 것 : TreeSet , HashSet
	공통특징 : 순서개념이 없다. 중복보관은 허용하지 않는다. 검색속도가 List 보다 월등

	TreeSet : 트리를 이용하여 보관, HashSet 는 해쉬 알고리즘으로 기억장소를 결정
*/
public class Test069_Set을_상속하는_클래스들_Tree_Hash {
    public static void main( String[] args ) {
		Set<String> ls = new HashSet<String>();
		ls.add("apple");
		ls.add("banana");
		ls.add("orange");
		ls.add("kiwi");
		ls.add("apple");

		//	java 의 표준 검색방법이 Iterator 
		Iterator<String> it = ls.iterator();
		while( it.hasNext() ) {
			String l = it.next();
			if( l.indexOf("an") != -1 ) {
				it.remove();
			}
		}

		System.out.println( ls );
	}
}
