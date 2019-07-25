import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

class Node<T> {
	T data = null;
	Node<T> next = null;

	Node(T t, Node<T> n) {
		data = t;
		next = n;
	}
}

class LinkedList<U> {

	private Node<U> head = null;
	private Node<U> tail = null;
	int size = 0;

	public LinkedList() {
		this.head = new Node<U>(null, null);
		this.tail = head;
	}

	Node<U> node(int index) {
		Node<U> x = head;
		for (int i = 0; i < index + 1; i++)
			x = x.next;
		return x;
	}

	public U get(int k) {
		Node<U> temp = node(k);
		return temp.data;
	}

	public void add(U d) {
		this.tail.next = new Node<U>(d, null);
		this.tail = this.tail.next;
		SizeUp();
	}

	public void SizeUp() {
		size += 1;
	}

	public int getSize() {
		return size;
	}

	public void print() {
		for (Node<U> n = head.next; n != null; n = n.next) {
			System.out.println(n.data);
		}
	}

	public void save1(String fileName) throws Exception {
		ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(fileName));
		out.writeInt(getSize());
		for (Node<U> n = head.next; n != null; n = n.next) {
			DataUtil.populate(n.data, out);
		}
		out.close();
	}

	public void load1(String fileName) throws Exception {
		// TODO Auto-generated method stub
		ObjectInputStream in = new ObjectInputStream(new FileInputStream(fileName));
		int size = in.readInt();
		for (int i = 0; i < size; i++) {
			this.add((U) new Score(in.readUTF(), in.readInt()));
		}
	}

	public void save2(String string) throws Exception {
		// TODO Auto-generated method stub
		ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(string));
		int size = this.getSize();
		out.writeInt(size);
		for (int i = 0; i < size; i++) {
			out.writeObject(this.get(i));
		}
		out.close();
	}

	public void load2(String fileName) throws Exception {
		// TODO Auto-generated method stub
		ObjectInputStream in = new ObjectInputStream(new FileInputStream(fileName));
		int size = in.readInt();
		for (int i = 0; i < size; i++) {
			this.add((U) in.readObject());
		}

		in.close();
	}
}

class DataUtil {
	public static void populate(Object ob, ObjectOutputStream out) throws Exception {
		if (ob instanceof Score) {
			Score sc = (Score) ob;

			out.writeUTF(sc.getId());
			out.writeInt(sc.getScore());

		}
	}
}

class Score implements Serializable {
	private String id = null;
	private int score = 0;

	public Score(String i, int s) {
		id = i;
		score = s;
	}

	public String getId() {
		return id;
	}

	public int getScore() {
		return score;
	}

	public String toString() {
		return id + " " + score;
	}
}

public class _9_성적관리시스템_파일입출력_정답 {
	public static void main(String[] args) throws Exception {
//		LinkedList<Score> ls = new LinkedList<Score>();
//		ls.add(new Score("10101", 100));
//		ls.add(new Score("10102", 90));
//		ls.add(new Score("10103", 80));
//		ls.add(new Score("10104", 70));
//		ls.save1("file.txt");
//		ls.print();
//		System.out.println();
//		LinkedList<Score> ls2 = new LinkedList<Score>();
//		ls2.load1("file.txt");
//		ls2.print();
//		System.out.println();
//
//		// 다른 방법
//		LinkedList<Score> ls3 = new LinkedList<Score>();
//		ls3.add(new Score("10101", 100));
//		ls3.add(new Score("10102", 90));
//		ls3.add(new Score("10103", 80));
//		ls3.add(new Score("10104", 70));
//		ls3.save2("file2.txt");
//		ls3.print();
//		System.out.println();
		LinkedList<Score> ls4 = new LinkedList<Score>();
		ls4.load2("file2.txt");
		ls4.print();
		System.out.println();
	}
}