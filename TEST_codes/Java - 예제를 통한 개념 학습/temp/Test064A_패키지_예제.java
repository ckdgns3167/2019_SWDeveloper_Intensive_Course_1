package temp;

public class Test064A_패키지_예제 
{
    public int print(){ return 200; }
    public int print2( int i ){ return 300 * i ; }

    public static int print3(){
        return 100;
    }
}
/*	패키지가 지정된 클래스 컴파일 : javac -d [폴더] Test064A.java
	대상폴더 아래에 패키지 이름으로 폴더 생기고 , 그 아래에 class 파일이 들어간다.

	- 패키지를 지정 안하면 Unnamed 패키지에 소속된다. 이건 사용시 제약이 많다.

	패키지는 클래스의 묶음 . 파일 맨 위에 지정 . 
		이 파일안에 선언한 모든 클래스는 지정된 패키지에 속한다.

	javac -d . Test064A.java

*/