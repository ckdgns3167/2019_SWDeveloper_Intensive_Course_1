package 코드와같이이해하는자바;

//package temp;
import java.io.OutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

//import의 단위는 클래스다.
//import는 언제하냐? 다른 패키지에 있는 클래스 내가 가져다 쓸 때!
//package - import- class 선언 식으로 온다 
//javac -d . Test 076.java
//java -classpath . temp.Test076
public class Test076_try_catch_throws의_차이 {

	public static void main(String[] args) {
		// :throws XXXException 형태로 선언된 함수는 XXXException이 깐깐할 경우(Exception을 상속받은 것들)에 해당
		// 예외를 처리할 수 있는 try catch 영역 안에서 사용해야 한다.
		try {
			OutputStream out = new FileOutputStream("a.ww");
		} catch (FileNotFoundException e) {
			// FileNotFoundException 을 IOException 으로 고쳐도 문제 없음.
		}
	}
	// main(String[] args) throws IOException 이 문법 에러가 아닌 이유
	// 1. 에러는 발생 시에 잡아주면 에러 발생 안된걸로 한다.(일사부재리)
	// 2. 에러가 발생할 수 있으면 그 사실을 명시하면 된다.
	// (아래 경우는 생성자 호출한 쪽이 아니라 main을 호출한 쪽이 처리한다. 사원이 사고치는데 대리는 그 책임을 부장에게 넘기고 부장이
	// 처리하도록 한다.)
}
