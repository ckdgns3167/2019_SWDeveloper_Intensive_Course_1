
class CustomThreaded implements Runnable {
	/*
	 * 오버라이딩 할 때 throws Exception 같은 거 붙이지 못한다. (조상에서 선언된 대로 해야함.)
	 */
	@Override
	public void run() {
		// TODO Auto-generated method stub
		for (int i = 0; i < 100; i++) {
			System.out.println("HelloWorld " + i);
		}
	}

}

public class Test093_Runnable_인터페이스 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Runnable rb = new CustomThreaded();
		rb.run();//단순한 함수 호출

		//BUT
		
		/*
		 	new Thread() 하면 가상의 CPU를 OS에서 할당받는다.
		 	할당받은 CPU는 생성자에 넘겨진 포인터를 물고간다.
		 	start() 호출시에 준비과정을 거쳐 새로운 가상 CPU가
		 	rb.run()을 호출한다.
		 	
		 	
		 	1. Runnable 상속받은 클래스 선언
		 	2. new Thread 하면서 1.의 인스턴스의 포인터를 넘긴다.
		 	3. thread::start() 를 호출하면 가상 CPU (쓰레드) 가 
		 		run()을 호출
		 */
		Thread th = new Thread(rb);
		th.start();
	}

}
