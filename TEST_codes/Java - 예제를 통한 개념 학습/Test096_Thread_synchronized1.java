

class Toilet {
	public void bigWork(String by) {
		synchronized (this) {//같은 메모리를 공유하고 있지만 다른 스레드에 의해 작업 도중에 끊기는 일을 막을 수 있다.
			/*
			 	모든 인스턴스에는 lock이라는 개념의 자물쇠? 열쇠?가 있다.
			 	synchronized(this){}
			 	this가 가리키는 인스턴스가 가지고 있는 록을 획득해야 {에 진입가능.
			 	획득하지 못하면 쓰레드는 멈추어 기다려야 한다.
			 	일을 마쳤으면 }시점에서 lock을 반납한다.
			 */
			
			System.out.println("STEP 1." + by);
			System.out.println("STEP 2." + by);
			System.out.println("STEP 3." + by);
			System.out.println("STEP 4." + by);
			System.out.println("STEP 5." + by);
		}
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

public class Test096_Thread_synchronized1 {

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
		 * 하나밖에 없는 화장실에서 대참사가 일어나는중... 쓰레드는 독자적으로 돌아가는 프로그램이기에 이런 일은 얼마든지 가능하다.
		 * 
		 * 화장실 문에 잠금을 해줘야 한다.
		 * 
		 * 쓰레드는 프로그램에서는 잠금이 중요한데 그것을 동기화(synchronization) 이라고 한다.
		 */
	}

}
