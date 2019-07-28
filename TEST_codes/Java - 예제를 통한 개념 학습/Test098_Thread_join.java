
class A implements Runnable {

	@Override
	public void run() {
		// TODO Auto-generated method stub
		for (int i = 0; i < 10; i++)
			System.out.println("A running");
	}

}

class B implements Runnable {

	@Override
	public void run() {
		// TODO Auto-generated method stub
		for (int i = 0; i < 10; i++)
			System.out.println("B running");
	}

}

class C implements Runnable {

	@Override
	public void run() {
		// TODO Auto-generated method stub
		for (int i = 0; i < 10; i++)
			System.out.println("C running");
	}

}

public class Test098_Thread_join {
	public static void main(String[] args) {
		Thread[] threads = new Thread[3];

		threads[0] = new Thread(new A());
		threads[1] = new Thread(new B());
		threads[2] = new Thread(new C());
		threads[0].start();
		threads[1].start();
		threads[2].start();
		try {
			// thread[0]이 끝나기 전에는 이 아래로 안내려간다.

			threads[0].join();
			threads[1].join();
			threads[2].join();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("최종정리");

	}
}
