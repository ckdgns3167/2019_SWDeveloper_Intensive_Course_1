package 코드와같이이해하는자바;

class Node {
	int data = 0;
	// 가리키기위한 변수가 참조형 변수 인데 아직 아무것도 가리키지 않을 때는 null
	Node next = null;// Node는 클래스 이름으로 선언 되어 있으니 참조형 변수가 맞다.
	// 가리키는 인스턴스가 없는 상태를 말함.
	// 생성자함수 : 멤버 변수 초기화

	public Node(int i, Node n) {
		this.data = i;
		this.next = n;
	}
}

class LinkedList {
	Node head = null;
	Node tail = null;

	public LinkedList() {
		this.head = new Node(0, null);
		this.tail = head;
	}

	void add(int a) {
		tail.next = new Node(a, null);
		tail = tail.next;
	}

	void print() {
		for (Node t = head.next; t != null; t = t.next) {
			System.out.print(t.data);
			if (t != tail)
				System.out.print("-");
		}
	}

}

// 모든 참조형 변수에는 null이라는 값이 대입 가능.
public class 참조형변수예제_Node이해 {
	public static void main(String[] args) {
//		Node head = new Node(0, null);
//		// 참조형변수의 대입은 오른쪽 포인터가 가리키고 있는 대상을 왼쪽 포인터도 가리키게 됨.
//		Node tail = head;
//
//		// 노드를 추가하고 tail이 원래 연결되어 있는 곳에서 끊고 끝에 연결 하는 코드.
//		tail.next = new Node(10, null);
//		tail = tail.next;
//
//		tail.next = new Node(30, null);
//		tail = tail.next;
//
//		for (Node t = head.next; t != null; t = t.next) {
//			System.out.println(t.data);
//		}
		LinkedList l = new LinkedList();
		l.add(10);
		l.add(20);
		l.add(30);
		l.print();
	}
}
