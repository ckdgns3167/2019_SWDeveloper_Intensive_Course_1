class Toilet {
	public void bigWork(String by) {
		synchronized (this) {
			System.out.println("STEP 1." + by);
			System.out.println("STEP 2." + by);
			System.out.println("STEP 3." + by);
			System.out.println("STEP 4." + by);
			System.out.println("STEP 5." + by);
		}
	}

	public synchronized void sleepWork(String by) {
		System.out.println("SLEEP STEP 1." + by);
		System.out.println("SLEEP STEP 2." + by);
		System.out.println("SLEEP STEP 3." + by);
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

			int time = (int) (Math.random() * 1000);
			if (time % 2 == 0) {
				toilet.bigWork("apple");
			} else {
				toilet.sleepWork("apple");
			}
			try {
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
			int time = (int) (Math.random() * 1000);
			if (time % 2 == 0) {
				toilet.bigWork("banana");
			} else {
				toilet.sleepWork("banana");
			}

			try {
				Thread.sleep(time);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}

public class Test097_Thread_synchronized2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Toilet t = new Toilet();
		new Thread(new A(t)).start();
		new Thread(new B(t)).start();

	}

}
