class Node <T extends Object> {
	T data = null;
	Node<T> next = null;

	Node( T i, Node<T> n ){
		data = i;
		next = n;
	}
}

/*	오늘의 과제 : LinkedList 클래스를 만들되 제너릭을 써서 만들 것.

class LinkedList <X extends Object>{
	add
	print
}
*/

public class Test053_제네릭_반복문X_노드연결 {
	public static void main( String[] args ) {
		Node<Integer> head = new Node<String>( null, null );
		Node<String> tail = head;

		tail.next = new Node<String>("apple",null);
		tail = tail.next;

		tail.next = new Node<String>("banana",null);
		tail = tail.next;

		tail.next = new Node<String>("orange",null);
		tail = tail.next;

		tail.next = new Node<String>("kiwi",null);
		tail = tail.next;

		for( Node<String> n = head.next ; n != null ; n = n.next ){
			System.out.println( n.data );
		}
	}
}
