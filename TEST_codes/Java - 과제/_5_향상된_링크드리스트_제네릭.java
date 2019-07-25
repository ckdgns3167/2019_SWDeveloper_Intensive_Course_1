package 제주과제4_제네릭_링크드;

class Node<T extends Object> {
	T data = null;
	Node<T> next = null;

	public Node(T i, Node<T> n) {
		this.data = i;
		this.next = n;
	}
}

class LinkedList<T> {
	Node<T> head = null;
	Node<T> tail = null;

	public LinkedList() {
		this.head = new Node<T>(null, null);
		this.tail = head;
	}

	void add(T a) {
		tail.next = new Node<T>(a, null);
		tail = tail.next;
	}

	void print() {
		for (Node<T> t = head.next; t != null; t = t.next) {
			System.out.print(t.data);
			if (t != tail)
				System.out.print("-");
		}
	}

}

public class _5_향상된_링크드리스트_제네릭 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		LinkedList<String> l = new LinkedList();
		l.add("1");
		l.add("2");
		l.add("3");
		l.print();
	}

}
