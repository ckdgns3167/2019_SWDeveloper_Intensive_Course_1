package temp;

public class Test066A_패키지_예제_static_initializer 
{
	//	static initializer 라 한다. 클래스가 로딩되는 시점에 호출됩니다.
	static {
		System.out.println( "Test066A loaded" );
	}
    
	public int print(){ return 200; }
    public int print2( int i ){ return 300 * i ; }

    public static int print3(){
        return 100;
    }
}
//	C:\A\ 아래에 컴파일 하자. javac -d C:\A\ Test066A.java