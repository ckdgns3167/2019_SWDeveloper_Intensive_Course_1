class Apple {
	int data = 0;
	
	//	return 문장이 없는 함수를 서브루틴이라 한다. 리턴타입을 void 로 선언한다.
	//	멤버함수 안에서 자신이 소속된 인스턴스에 대한 포인터를 사용가능 : this 

	//	오늘 과제 : 나눠준 temp04.c 파일을 분석해서 java 와 비교해서 리포트 작성.
	//	함수 하나의 길이가 크다고 해서 인스턴스를 많이 생성하면 메모리에 부담가나? NO

	void print( ){
		System.out.println( this.data );
	}
}

public class Test028_void타입함수{
	public static void main( String[] args ){
		Apple t = new Apple( );
		t.data = 10;
		t.print();

		Apple l = new Apple( );
		l.data = 20;
		l.print(); 
	}
}




