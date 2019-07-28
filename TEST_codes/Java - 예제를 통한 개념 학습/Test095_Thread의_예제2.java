

class Toilet {
	public void bigWork(String by) {
		System.out.println("STEP 1." + by);
		System.out.println("STEP 2." + by);
		System.out.println("STEP 3." + by);
		System.out.println("STEP 4." + by);
		System.out.println("STEP 5." + by);
	}
}

class A implements Runnable {

	private Toilet toilet = null;

	public A(Toilet t) {
		toilet = t;
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		for (int i = 0; i < 100; i++) {
			toilet.bigWork("apple");
			try {
				int time = (int) (Math.random() * 1000);
				Thread.sleep(time);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}

class B implements Runnable {
	private Toilet toilet = null;

	public B(Toilet t) {
		toilet = t;
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		for (int i = 0; i < 100; i++) {
			toilet.bigWork("banana");
			try {
				int time = (int) (Math.random() * 1000);//
				Thread.sleep(time);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}

public class Test095_Thread의_예제2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Toilet t = new Toilet();
		new Thread(new A(t)).start();
		new Thread(new B(t)).start();
		/*
		 * 쓰레드는 독자적으로 돌아가는 프로그램이 된다. :Apple 사이에 Banana 끼어들게 안짰는데 결과는 그러했다. 어떻게 해석할까? 각
		 * 스레드는 독자적으로 돌아가고 있다.
		 */
		
		/*
		 하나밖에 없는 화장실에서 대참사가 일어나는중...
		 쓰레드는 독자적으로 돌아가는 프로그램이기에 이런 일은 얼마든지 가능하다.
		 
		 화장실 문에 잠금을 해줘야 한다.
		 
		 쓰레드는 프로그램에서는 잠금이 중요한데 그것을 동기화(synchronization) 이라고 한다. 
		 */
	}

}
