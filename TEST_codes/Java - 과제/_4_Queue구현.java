package 제주과제3;

class Node {
	Object data = 0;
	Node next = null;

	Node(Object i, Node next) {
		this.data = i;
		this.next = next;
	}
}

abstract class Queue {

	abstract public void offer(Object j);

	abstract public Object poll();

	abstract public void print();

}

class LinkedListQueue extends Queue {
	Node head = null;
	Node tail = null;

	public LinkedListQueue() {
		this.head = new Node(0, null);
		this.tail = head;
	}

	@Override
	public void offer(Object j) {
		// TODO Auto-generated method stub
		tail.next = new Node(j, null);
		tail = tail.next;
	}

	@Override
	public Object poll() {
		// TODO Auto-generated method stub
		Node item = head.next;
		head.next = head.next.next;
		return item;
	}

	@Override
	public void print() {
		System.out.print("선입  [ ");
		for (Node t = head.next; t != null; t = t.next) {
			System.out.print(t.data + " ");

		}
		System.out.println("] 후입");
		System.out.println();
	}
}

public class _4_Queue구현 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Queue q = new LinkedListQueue();
		System.out.println("---큐에 아이템 push---");
		q.offer(0);
		q.offer(1);
		q.offer(2);

		q.print();

		q.poll();
		System.out.println("---poll 후 출력---");
		q.print();

		q.poll();
		System.out.println("---poll 후 출력---");
		q.print();

		q.poll();
		System.out.println("---poll 후 출력---");
		q.print();

	}

}
