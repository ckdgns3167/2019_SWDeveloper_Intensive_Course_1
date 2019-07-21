import temp.Test065A_패키지_예제;

public class Test065_-classpath의_사용 {
    public static void main( String[] args ) {
        Test065A t = new Test065A();
		System.out.println( t.i );
    }
}
//	-classpath 옵션을 안주면 -classpath . 이 자동으로 붙는다.
//	Test065A 의 멤버변수 i 가 접근 되는지 살펴본다 : protected , friendly 