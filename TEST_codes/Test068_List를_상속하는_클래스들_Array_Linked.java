import java.util.*;

/*	ArrayList 속도가 빠르다. 내부적으로 배열을 이용한다. 
	- 배열을 써서 단순히 삽입 속도는 빠른데 , 중간 삭제시에는 비효율적이다. 

	LinkedList 는 Node 를 이용하기에 단순하게 쌓는 속도는 느리다.
		중간에 추가 삭제가 빈번한 경우에는 용이하다.

	둘 다 List 를 상속한다. List 를 상속받은 클래스는 특징이 존재한다.
	- 중복되는 걸 허용 한다. 검색시에 들어간 순서대로 나온다 ( 순서대로 보관한다 )
*/
public class Test068_List를_상속하는_클래스들_Array_Linked {
    public static void main( String[] args ) throws Exception {
		List<String> l = new ArrayList<String>();
		l.add("apple");
		l.add("banana");
		l.add("orange");
		l.add("kiwi");
		l.add("apple");

		//	향상된 for 문장
		for( String t : l ) {
			System.out.println( t );
		}
	}
}
