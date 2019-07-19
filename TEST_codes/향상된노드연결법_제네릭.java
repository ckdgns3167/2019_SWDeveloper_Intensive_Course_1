package 코드와같이이해하는자바;

class Nodde<T extends Object> {
	T data = null;
	Nodde<T> next = null;

	Nodde(T i, Nodde<T> n) {
		data = i;
		next = n;
	}
}

public class 향상된노드연결법_제네릭 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Nodde<String> head = new Nodde<String>(null, null);
		Nodde<String> tail = head;

		tail.next = new Nodde<String>("apple", null);
		tail = tail.next;
		tail.next = new Nodde<String>("banana", null);
		tail = tail.next;
		tail.next = new Nodde<String>("orange", null);
		tail = tail.next;
		tail.next = new Nodde<String>("kiwi", null);
		tail = tail.next;

		for (Nodde<String> p = head.next; p != null; p = p.next) {
			System.out.println(p.data);
		}

	}

}
