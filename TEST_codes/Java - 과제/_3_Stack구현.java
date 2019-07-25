package 제주과제3;

class Stack {
	Node head = null;
	Node tail = null;

	public Stack() {
		this.head = new Node(0, null);
		this.tail = this.head;
	};

	public void push(int i) {
		if (this.head.next != null)
			this.head.next = new Node(i, this.head.next);
		else
			this.head.next = new Node(i, null);
//		tail.next = new Node(i, null);
//		tail = tail.next;
	}

	public Node pop() {
		Node item = head.next;
		head.next = head.next.next;
		return item;
	}

	public void print() {
		System.out.print("위  [ ");
		for (Node t = head.next; t != null; t = t.next) {
			System.out.print(t.data+" ");
			
		}
		System.out.println("] 아래");
	}
}

public class _3_Stack구현 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Stack s = new Stack();
		System.out.println("---스텍에 아이템 푸쉬---");
		s.push(0);
		s.push(1);
		s.push(4);
	
		s.print();
		
		System.out.println();
		System.out.println("---pop 후 출력---");
		s.pop();
		
		s.print();
		
	}

}
