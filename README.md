<div>
  <h1>제주에서 자바(JAVA) 한잔하기! <img src="https://user-images.githubusercontent.com/52457180/61193310-934ce800-a6f5-11e9-836e-63c8cd123b7f.png" height="30px"></img></h1> 
</div>

---------

<div pointer-events: none;>
<img src="https://user-images.githubusercontent.com/52457180/61193203-d8bce580-a6f4-11e9-8885-99cd29779346.png" width="150%"></img>
</div>

---------
## 노트 필기 내용 정리 
각 차의 주제는 임의로 정한 것

### 1일차 학습 내용 : Java 설치 및 기본 이론(변수 관련)

* JAVA의 main 함수의 필요성 : 프로그램을 시작하기 위해 필요한 함수, 없으면 오류, 정해져있는 룰(약속)
* JAVA의 8개 자료형 
  - 적합한 기억공간을 갖는 자료형을 택할 줄 알아야 함.  
  - byte, short, int, long, float, double, boolean, char
  - 작은 타입에서 큰 타입은 자동 캐스팅되지만, 큰 타입에서 작은 타입은 강제 캐스팅이 없으면 에러.
  - 기본적으로 같은 타입의 변수끼리 연산이 가능하다. 
* 변수의 선언과 변수 Copy의 이해
* 변수 박싱, 언박싱, 오토박싱의 이해 - 개인적으로 공부할 내용.


### 2일차 학습 내용 : 코드 작성의 노하우 & C언어와의 차이(변수, 함수)

* 코드 잘 짜는 방법 
  - 잘 쪼개서 짠다. 자신의 보폭을 잘 파악해야 한다.
  - 반복문이 이해가 잘 안되면 일단 늘어놓고 이해하고나서 정리하는 식으로 해도 된다. 처음부터 무리하지말라
  - 버리는 코드를 잘 짜야 한다. (위에 늘어놓은 코드(이해하기 위한))
* C언어의 특징
  - C언어의 경우 변수의 선언은 위에 몰아서 하는게 원칙이다. 
  - C언어의 경우 자료형의 포인터 형 변수가 존재. 참조의 개념을 이해하면 됨. *, & 기호의 용도
  - 자료형 변수의 대입과 포인터의 대입은 다르다.
  - 포인터의 대입은 오른쪽이 가리키는 대상을 왼쪽이 가리키게 된다.
  - 자료형 변수의 대입은 오른쪽 변수의 값이 복사되어 왼쪽 변수에 들어간다.
  - void*를 이해하면 정말 좋다. 그럼 이건 무엇인가..? 어떤 타입의 기억공간이든 모두 가르킬 수 있다.
  - 하지만 실체에 접근할 수는 없다. 즉 그 주소의 실제 값을 뽑을 수 없다. 하지만 다른 이름의 자료형 포인터와 같은 타입으로 형변환하여 같다고 하고 다른 이름의 자료형 포인터의 값을 뽑으면 뽑을 수 있다.
  ```
  void main(){
    void* t;
    int i;
    i = 100;
    t = &i;

    int* h;
    h = (int*) t; //형변환
    printf("%d\n", *h);
  }
  ```
  - 함수의 기본 동작 방식에 대한 이해 : 매개면수, 리턴타입, ...
  - 함수 포인터 개념 이해하기 
  ```
  int add( int i, int j ) {
	  int t;
	  t = i + j;
	  return t;
  }
  void main(){
    int r;
    //아래와 같이 선언된 변수 fp는 함수를 가리킬수 있다.
    //리턴 타입이 int, 매개변수가 int, int 형태로 선언된 함수를 
    int (*fp) (int, int);
    fp = add;
    
    //fp 라는 함수가 아닌 fp 변수가 가리키는 함수를 호출한다.
    r = fp(10,20);
    printf("%d\n", r);
    return 0;
  }
  ```
* Java의 클래스 개념
  - 클래스를 선언하고, 그 이름으로 변수 선언이 가능한데, 이런 변수를 참조형 변수라고 한다. (실은 다 포인터)
  - new를 이용해서 인스턴스를 만들 수 있다.
  - 클래스 이름으로 선언된 변수는 참조형 변수이고, 이것은 해당 클래스를 이용해 만들어진 인스턴스를 가리킬 수 있다.
  - 클래스는 설계도다. (변수, 함수가 설계되어 있음.) - 실제로 활용은 안 된다.
  - new를 이용해 실제로 클래스 설계도를 통해 하나의 객체를 만들어낸다. 그 때 그 객체는 자신의 변수와 함수를 이용 가능한 상태가 된다. 
  - 인스턴스는 이름이 없다. 단 포인터로 실체에 접근이 가능하다.
  - 변수와 함수를 실제로 보유하고 있는 것은 참조형 변수가 아닌 인스턴스이다. 
  ```
  #include <stdio.h>
  #include <stdlib.h>
  //두 개의 변수를 묶어서 apple이라는 이름으로 '구조체'를 정의
  struct apple {
	int i;
	int add;
  };

  int main(){
	//apple 구조체의 기억공간을 가리킬 수 있는 포인터 변수 t 선언
	struct apple* t;
	//구조체 크기의 기억공간 할당. t 포인터가 해당 공간을 가리킴.
	t = (struct apple*) malloc(sizeof(struct apple));//java의 new와 같은 기능을 함. 이 기억공간은 이름이 없음. 하지만 포인터로 접근이 가능하게 됨. 
	//이 공간은 로컬 변수가 아님, 자동삭제 안 된다.
	//free는 입력으로 들어온 변수가 가리키는 대상을 삭제한다. 즉 t라는 기억공간을 자유롭게 해준다. 
	free(t);
	
	return 0;
  }
  ```	- 
  - Java의 클래스는 C에서의 구조체와 비슷하다.
* Java의 객체지향적인 설계는 C로도 구현이 가능하다. Java의 new에 대한 깊은 이해
  ```
  #include <stdio.h>
  #include <stdlib.h>
  int apple_add(int a, int b)
  {
    	return 100;
  }
  //구조체 
  typedef struct apple {
  	int i;
	int (*add) (int,int);
  }Apple;
  
  //인스턴스 생성과 유사한 동작을 하게 된다. 이렇게 해서 생성되고, 이것을 가리키는 포인터를 통해서 함수와 변수가 접근되어질 수 있다. 
  Apple* new_Apple(){
  Apple* n;
  n = (Apple*) malloc(sizeof(Apple));
  n->add = apple_add;
  	return n;
  }
  int main(){
  Apple* t;
  //	struct apple* t;
  //	 t = (Apple*) malloc(sizeof(Apple));
  t = new_Apple();
  //	t = (struct apple*) malloc(sizeof(struct apple));
  // 포인터 t 가 가리키는 대상 안에 있는 i 변수에 대입한다.  
  t->i = 100;
  t->add = apple_add;
  printf("%d\n",(t->i+t->add(10,20)));

  free(t);

  return 0;
  }
  
  ```
* Java의 변수, 함수의 종류에 대한 이해
  - 멤버함수, 멤버변수는 class 내부에 선언됨.
  - 참조형 변수 & 자료형 변수
  - 인스턴스가 생성되는 동시에 멤버 변수, 함수는 기억공간이 할당된다.
