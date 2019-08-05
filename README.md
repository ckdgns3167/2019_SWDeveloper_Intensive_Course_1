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

### 1 일차 학습 내용 : Java 설치 및 기본 이론(변수 관련)

* JAVA의 main 함수의 필요성 : 프로그램을 시작하기 위해 필요한 함수, 없으면 오류, 정해져있는 룰(약속)
* JAVA의 8개 자료형 
  - 적합한 기억공간을 갖는 자료형을 택할 줄 알아야 함.  
  - byte, short, int, long, float, double, boolean, char
  - 작은 타입에서 큰 타입은 자동 캐스팅되지만, 큰 타입에서 작은 타입은 강제 캐스팅이 없으면 에러.
  - 기본적으로 같은 타입의 변수끼리 연산이 가능하다. 
* 변수의 선언과 변수 Copy의 이해
* 변수 박싱, 언박싱, 오토박싱의 이해 - 개인적으로 공부할 내용.

--------------------------------


### 2 일차 학습 내용 : 코드 작성의 노하우 & C언어와의 차이(변수, 함수)

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
  ​```	- 
  - Java의 클래스는 C에서의 구조체와 비슷하다.
  ```
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
    //	t = (Apple*) malloc(sizeof(Apple));
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
* Java의 변수, 함수의 종류, 여러 용어에 
  - 멤버함수, 멤버변수는 class 내부에 선언됨.
  - 참조형 변수 & 자료형 변수
  - 인스턴스가 생성되는 동시에 멤버 변수, 함수는 기억공간이 할당된다.
  - 클래스, 인스턴스, new, 참조형, 자료형 변수, 멤버 변수, 멤버 함수, 로컬 변수, 생성자 함수, :    
  - 클래스는 어떤 것을 만들기 위해 필요한 설계도라고 볼 수 있습니다. 클래스가 선언되었다고 그안에 표현된 것들이 동작되는 것이 아닙니다. 실제로 동작될 수 있기 위해 new라는 예약어를 통해 해당 클래스의 인스턴스를 생성시킬 수 있습니다. 근데 이 인스턴스는 이름이 없습니다. 그냥 메모리에 공간이 할당된 상태일 뿐입니다. 이제 이것을 참조형 변수라는 것을 통해 가리킬 수 있고 멤버 변수, 멤버 함수에 접근하여 동작할 수 있게 합니다. 자료형 변수의 대입은 오른쪽 값이 왼쪽으로 복사되어 대입되며, 참조형 변수의 대입은 오른쪽 포인터가 가리키고 있는 대상을 왼쪽 포인터가 가리키게 되는 과정입니다. 생성자함수는 클래스 내에 존재하는 것인데, 인스턴스가 생성될 때 호출되는 함수입니다. 멤버 변수의 초기화를 위해 사용됩니다. 
  
-------------------------

### 3 일차 학습 내용 : 자바의 객체지향적 특징을 예제 코드를 직접 코딩하면서 이해했다.  

* 객체지향 언어의 3대 속성
  - 상속성 : 클래스를 상속해서 클래스를 만든다.
  - 은닝성 : 감추고 싶은건 감출 수 있다. private, protected, public
  - 다형성 : 하나의 심볼(이름)이 여러 실체에 매핑될 수 있다.
* protected  
  - 같은 패키지에서는 접근가능.
  - 다른 패키지에서는 접근 불가능.
* friendly  
  - 같은 패키지에서는 public 으로... 
  - 다른 패키지에서는 private 으로...
* 멤버변수는 무조건 private로 하는게 맞다. 어차피 부모의 멤버변수가 호출되기 때문.. 오버라이딩되지않는다. 변수는.
  - 이 변수에 접근하기 위해서는 게터, 세터를 이용해 접근하고 변경할 수 있다. (바람직한 방법, 헷갈리지 않는다 결국에는)
  - 조상에서 getXXX가 보이걸랑 그런 변수가 있는 줄 알고 XXX 변수는 자손에서 쓰지 않도록 피해갈 수 있어야한다.
* 상속(extends, abstract, interface, implements)
* 디자인 패턴
  - 데코레이터 패턴 : 자바 io 패키지가 이걸로 만들어져 있음!
* Object(이 둘이 뭉뚱그려져 있는 개념) = class(추상적인 특징을 모아둔 설계도) + instance(설계도 대로 그 특징을 갖는 실체, 자기 자신 혼자 독립적인 것) 

-------------------------------

### 4 일차 학습 내용  

* 오버로딩 실습
* 클래스 캐스팅 - 멤버 변수의 오버라이딩으로 인한 문제점 인식, 게터세터의 사용의 이유
* static의 이해 - 스테틱으로 선언된 변수와 함수의 로딩시점에 따른 보통 변수와 함수와의 이용방법의 차이를 이해함.
* 참조형변수에서의 캐스팅과 자료형변수에서의 캐스팅에 대한 이해.
* 클래스도 강제로딩이 가능하다. 할수있다는 것만 일단 알자.
* OBject 클래스, 캐스팅
* 제네릭
* 언박싱, 오토박싱
* 커맨드패턴, 빈 인터페이스의 사용법 - 쓰임당하는 쪽에서 쓰는 쪽에 어떤 용도로 써달라고 할때 절묘하게 쓰일 수 있다.
* 스트링버퍼의 append의 이해

----------------------

### 5 일차 학습 내용 

* instanceof 의 사용이유 : [참조형 변수 instanceof 클래스명] : 참조형 변수가 클래스명으로 캐스팅이 가능한지 알아보기위해
  - 참조형 변수의 옳지못한 캐스팅으로 인한 오류를 잡을 수 있음.
* boolean
* 패키지의 사용과 import의 사용 : 다른 패키지의 클래스는 반드시 import해서 사용, 그래도 클래스를 찾을 수 없는 경우 클래스 위치를 지정해 주어야 한다. (내 생각 : 별 쓸일 없으니 이런게 있다고만 알아두자) 그래고 이클립스 환경이 아닌 리눅스 환경에서 컴파일해서 클래스 파일 수정하고 하는 과정에서 많이 쓰임 - 유지보수에 좋음... 하지만 지금은 이클립스 환경에서는 쓸일이없긴함. 
  - javac -d [폴더] 클래스명.java 를 cmd에서 하면 나중에 같은 패키지에서 다른 클래스가 가져다 쓸 수 있게 함, 클래스 파일이 [폴더]를 목적(d)로 저장시켜주는 것. 
  - -classpath를 사용해서 위치 지정, 옵션이 없으면 자동으로 path에 . 으로 됨. 그래서 java로 실행할 때 .;실행파일위치로 classpath를 지정해준다.
* static initializer, Class.forName("클래스명") : 클래스를 찾아내서 해당 클래스를 강제로 메모리에 올림.
  - Class 로딩된 클래스들을 관리하는 클래스 
* getMethod() : 클래스 안에서 선언된 함수에 대한 포인터들을 추출한다.  
* annotation  
* 예외처리  
* Collection - List, Map, Set   

----------------------------------

### 6 일차 학습 내용

* 소켓 통신의 기본을 직접 코딩해보며, 이해를 해봄.
* 파일 입출력 - 버퍼의 사용 이유

-------------------


### 7 일차 학습 내용

* String 멤버함수 
  - indexOf 와 subString을 조합하여 , 를 기준으로 문자열 분리 ==> split 함수와 비교해서 이해했음. 분리하는 문자의 개수에 따라 두 방법 중 하나를 택하여 사용하자!!!
  
---------------------------

### 8 일차 학습 내용 : 데이터베이스 교육 시작!!!

* 7일차 과제 리뷰 : 서버와 클라이언트 간 소켓 통신으로 파일 전송 받기, 링크드 리스드를 파일에 저장하고 불러오기 프로그램 만들기
* 데이터 베이스 기초 문법 : DDL, DML 쿼리 경험
* char와 varchar의 차이와 쓰임
* group by절이 있을 때, where절과 having절에서의 쓰임 - 동작 순서를 살펴봄 그룹별로 나온 결과에 대한 선처리는 having에서!

------------------


### 9 일차 학습 내용 : 데이터베이스 설계 - 다이어그램 그리기

* E-R diagram 예제 그려보기 - 비디오 가게
* 정규화개념 살짝 ~
* JOIN - INNER , OUTER
* CONSTRAINT 
* 무결성

-----------------

### 10 일차 학습 내용

* Thread의 개념 : 소프트웨어의 가상의 CPU, 서버의 필수 사항, 공정한 서비스를 주기위한...
* synchronized의 개념
* join의 개념 : 각각의 쓰레드 런들이 다 끝나고 실행되는 것을 만들 때 쓰임. 
* 소켓 통신 쓰레드 적용하여 구현하기
* 복습내용 : Class.forName - 호출하면 클래스의 static 이니셜라이져 호출하게됨. 클래스 로딩시킴.
* JDBC 실습 - cursor개념 - 서버 사이드 커서!!, Connection , executeUpdate , executeQuery
* select된 결과가 conn.close() 이후에도 남아있을 수 있게 하기 위해 그 결과의 한 레코드를 객체화 하여 List에 담는다.
* mysql 과 oracle에 대한 jdbc 커넥션 하고 일처리 하는 부분은 별 다른게 없음. 

------


### 11 일차 학습 내용

* 전 까지는 mysql에 대한 DB 실습을 했다. 이때부터 Oracle로 실습을 했다. 약간 문법의 차이가 있다.
* DML 쿼리문에 대한 함수로 만들어서 재사용성 올리는 거 배움
* sql 문장의 에러로 인한 stmt.executeUpdate에서 예와 발생함-> conn.close()실행되야 하는데 못하게 됨.->try/catch/finally를 통해 이를 처리하게 함.  
* 트렌젝션 - 2개 이상의 update 문을 하나 처럼 묶는 개념..
* 로그에 쌓았다가 한꺼번에 다 반영하던지 다 버리던지 !!
* 동일한 conn에서 작업한 내용만 트랜잭션으로 묶을 수 있다.
* commit , rollback

--------

### 12 일차 학습 내용 - JSP를 배우기 위한 아파치 톰캣 사용 이해

* **tomcat**
  * startup.bat 톰캣 실행
  * shutdown.bat 톰캣 종료
  * conf - server.xml
* web은 실제로 파일 다운로드 소켓 프로그램과 기본은 같다.
* 클라이언트 : 웹 브라우저
* 서버 : 톰캣 (Web Application Server : WAS)
* 브라우저가 톰캣에 접속해서 서버의 파일을 다운로드 받아 보여준다.
* 톰캣 서버 하나에는 여러개의 Web Application 이 설치 가능하다. 이것을 Context라고함.
* Context가 가져야 하는 것 : 홈 디렉터리와 접근경로를 가져야 한다. 
* C:\StudyHome\ 폴더 생성 = 홈 디렉터리 mkdir C:\StudyHome\
* C:\StudyHome\WEB-INF 폴더 생성 
* C:\StudyHome\WEB-INF\classes 폴더 생성
* C:\StudyHome\WEB-INF\lib 폴더 생성
* 클라이언트는 홈 디렉터리 아래의 모든 파일을 다운 가능하다. 
  * 단 WEB-INF는 접근이 불가능하다. 특수한 의미를 갖는다. 브라우저에 공개치 않는다.
  * 내부 설정 파일 등을 놓는다. 
  * classes : java class 파일을 놓는 곳
  * lib : 동작에 필요한 jar 파일을 놓는 곳

##### WEB-INF 파일 내에서 

- copy C:\apache-tomcat-8.0.45\webapps\ROOT\WEB-INF\web.xml 를 통해 파일 복사

##### web.xml 파일 내에서

```xml
<?xml version="1.0" encoding="ISO-8859-1"?>

<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
                      http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
  version="3.1"
  metadata-complete="true">
	<!--
		this is comment of xml files
	-->

</web-app>
```

기본적인 Context 설정은 되었다.

이제 이것을 톰캣에 등록해야 한다.

server.xml 의 Host 아래에 Context를 아래와 같이 추가한다.

```xml
<Host name="localhost"  appBase="webapps"
            unpackWARs="true" autoDeploy="true">

		<Context docBase="C:\StudyHome" path="/study" reloadable="true" ></Context>
```

**주의** ) 대소문자 구분을 꼭 해줘야한다... docBase를 docbase라고 치는 바람에 안 됐다.

##### C:\StudyHome\test.html 파일을 아래의 내용으로 만들고 저장 (테스트 용으로 만든 html파일)

```html
<html>
  	<body>
        HelloWorld : ^^*
    </body>
</html>
```

그리고 나서 톰캣 startup.bat을 실행시키고 웹 브라우저로 접속해보자. http://192.168.2.36:8081/study/test.html



#### server.xml

```xml
<Host name="localhost"  appBase="webapps"
            unpackWARs="true" autoDeploy="true">

		<Context docBase="C:\StudyHome" path="/study" reloadable="true" ></Context>
    
    ...server.xml 코드의 일부
```

#### web.xml

```xml
<?xml version="1.0" encoding="ISO-8859-1"?>

<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
                      http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
  version="3.1"
  metadata-complete="true">

	<servlet>
		<servlet-name>abcd</servlet-name>
		<servlet-class>s2.HelloWorld2</servlet-class>
	</servlet>
	
	<servlet-mapping>
		<servlet-name>abcd</servlet-name>
		<url-pattern>/study01</url-pattern>
	</servlet-mapping>

</web-app>
```

#### 서블릿의 동작 흐름 **

0. WAS 쪽에 적절히 설정이 되어 있다고 가정한다.
1. 브라우저에서 /study/study01 으로 요청이 들어온다.
2. /study로 경로를 설정한 Context가 있나? 있다고 가정하자.
3. 2에서 찾은 Context의 docBase 폴더(C:\StudyHome) 아래의 /WEB-INF/web.xml을 찾는다.
4. 거기에서 url-pattern 중 /study01 에 해당하는 설정이 있나 ? 있다고 가정하자. 
   1. 이것은 어떤 서블릿 이름을 지명하나? abcd라고 했었다.
5. abcd로 이름 붙여진 서블릿 클래스가 있나? apple.HelloWorld2
6. apple.HelloWorld2를 찾고 -> 인스턴스 생성하고 -> 오버라이딩 하는 service 함수를 호출한다.
7. System.out.println(""HelloWorld2); 은 서버 쪽에 찍히는 것이고,
8. PrintWriter out = response.getWriter(); 를 이용하여 내보내는 것은 요청으로 들어온 브라우저 쪽으로 내보내진다.
9. 요청했던 브라우저는 응답으로 전달된 내용을 받아 화면에 출력한다.

----

### 13 일차 학습 내용 - 서블릿 

* HTML의 form에서 submit을 누르면 action에서 지정한 서블릿을 실행케하는 예제 학습
  + 서블릿을 거쳐서 다시 html로 돌아오는 예제 ( 요청과 응답이 두 번씩 일어남. )

```html
-test_02.html

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <!--                     **중요**
		sumbit을 누르면 , action에 지저된 페이지를 요청한다.
		form 안의 input에 입력된 정보를 물고 간다.
		이렇게 요청받은 것은 서버에서 request.getParameter로 추출한다.
		name에 지정된 것을 key값으로 사용하여 하게 된다.
	-->
    
	<form method="POST" action="form_test2">
		<input type="text" name="gul" size=""50/>
        <!--
			checkbox 는 체크 후에 넘기면 value에 지정된 값이 읽혀지고
			체크없이 넘기면 null 값을 읽게 된다.
		-->
      	<input type="checkbox" name="abcd" value="apple"/>
	    <input type="checkbox" name="xyzz" value="banana"/>
        <!--
			같은 이름을 가진 radio 는 하나만 체크가 된다. 
		-->
        <input type="radio" name="method" value="plus" checked="checked"/>
	    <input type="radio" name="method" value="minus"/>
        <!--
			type="text" 와 같은데 입력 내용이 보이지 않는다.
		-->
        <input type="password" name="pwd" size="16"/>
        <!--
			여러줄 입력할 때 사용되는 것, 태그 안의 입력 값은 디폴트로 들어가 있는 것
		-->
        <br/><br/><br/><!--줄바꿈-->
        <textarea rows="7" cols="50" name="content">helloWorld</textarea>
        
        <!--
			흔히 콤보박스라는 선택창이 나오고 그 중의 하나만 선택할 수 있다.
		-->
       	<br/><br/><br/>
       	<select name="fruit">
	    	<option value="apple">사과</option>
	    	<option value="banana">바나나</option>
	    	<option value="orange">오렌지</option>
	    	<option value="kiwi">키위</option>
		</select>
        
		<input type="submit">
	</form>
</body>
</html>
```

```java
package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FormTestServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("FormTestServlet");
		//http://localhost:8081/study2/test_02.html
        
        //text
         String gul = request.getParameter("gul");
		System.out.println("gul : "+ gul);
        
        //checkedbox
         String abcd = request.getParameter("abcd");
		String xyzz = request.getParameter("xyzz");
		System.out.println("abcd : "+ abcd);
		System.out.println("xyzz : "+ xyzz);
        
        //radio
        String method = request.getParameter("method");
        System.out.println("method : " + method);
        
        //password
        String pwd = request.getParameter("pwd");
        System.out.println("pwd : " + pwd);
        
        //textarea
        String content = request.getParameter("content");
        System.out.println("content : " + content);
        
        //select
        String fruit = request.getParameter("fruit");
        System.out.println("fruit : " + fruit);
        
        response.sendRedirect("/study2/test_02.html ");//컨텍스트 경로, 파일 경로
	}
	/*
		sendRedirect : 브라우저에게 해당 경로로 요청할 것을 지시한다.
		getParameter : 요청시에 곁다리(?) 로 들어온 정보를 추출한다.
	*/
}
```

------

- **중요**) DAO pattern 설계 기법

  -  jdbc 와 web쪽 구현을 서로 영향 없이 구현할 수 있게 하는 방법!
    - BangMyungDAO interface

  ```java
  package study2;
  
  import java.util.List;
  
  public interface BangMyungDAO {
  
  	public void add(BangMyungVO vo) throws Exception;
  
  	public List<BangMyungVO> findAll() throws Exception;
  
  }
  ```

  

  ​	: BangMyungDAO - 방명록에 필요한 데이터 입출력 기능을 모아서 추상화 했다. add, findAll

  ------

  - 인터페이스 implements

    - BangMyungDAO_KaraImpl : 가짜 데이터베이스

      ```java
      package study2;
      
      import java.util.ArrayList;
      import java.util.Date;
      import java.util.List;
      
      public class BangMyungDAO_KaraImpl implements BangMyungDAO {// 데이터 베이스 없이 돌아가는 DAO를 구축해놓은 클래스...!!
      
      	private static List<BangMyungVO> data = new ArrayList<BangMyungVO>();// DB를 흉내내는 것
      	private static int no = 0;
      
      	@Override
      	public void add(BangMyungVO vo) throws Exception {
      		vo.setNo(no++);
      		Date now = new Date();
      		vo.setTheTime(now.toString());
      		data.add(vo);
      	}
      
      	@Override
      	public List<BangMyungVO> findAll() throws Exception {
      		return data;
      	}
      
      }
      ```

    - BangMyungDAO_OracleImpl : 진짜 데이터베이스와의 연결

      ```java
      package study2;
      
      import java.sql.Connection;
      import java.sql.DriverManager;
      import java.sql.ResultSet;
      import java.sql.Statement;
      import java.util.ArrayList;
      import java.util.List;
      
      public class BangMyungDAO_OracleImpl implements BangMyungDAO {
      
      	@Override
      	public void add(BangMyungVO vo) throws Exception {
      		// TODO Auto-generated method stub
      
      		Connection conn = null;
      		Statement stmt = null;
      		try {
      			Class.forName("oracle.jdbc.driver.OracleDriver");
      			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "HR");
      			stmt = conn.createStatement();
      			String sql = "insert into bangmyung_t values (seq_bangmyung.nextval, '" + vo.getGul() + "', sysdate)";
      			stmt.executeUpdate(sql);
      
      		} catch (Exception e) {
      			throw e;
      		} finally {
      			try {
      				if (stmt != null)
      					stmt.close();
      				if (conn != null)
      					conn.close();
      			} catch (Exception e) {
      				e.printStackTrace();
      			}
      
      		}
      	}
      
      	@Override
      	public List<BangMyungVO> findAll() throws Exception {
      		// TODO Auto-generated method stub
      		List<BangMyungVO> ls = new ArrayList<BangMyungVO>();
      		Connection conn = null;
      		Statement stmt = null;
      		ResultSet rs = null;
      		try {
      			Class.forName("oracle.jdbc.driver.OracleDriver");
      			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "HR");
      			stmt = conn.createStatement();
      			String sql = "SELECT no, gul, the_time FROM bangmyung_t order by no";
      			rs = stmt.executeQuery(sql);
      			while (rs.next()) {
      				BangMyungVO vo = new BangMyungVO();
      				vo.setNo(rs.getInt(1));
      				vo.setGul(rs.getString(2));
      				vo.setTheTime(rs.getString(3));
      				ls.add(vo);
      			}
      		} catch (Exception e) {
      			throw e;
      		} finally {
      			if (rs != null)
      				rs.close();
      			if (stmt != null)
      				stmt.close();
      			if (conn != null)
      				conn.close();
      		}
      
      		return ls;
      	}
      
      }
      ```

    **설명** 

    - 데이터를 다루는 클래스는 독립시켜서 만드는 경향이 있다. (별도의 클래스)
    - A라는 사람과 B라는 사람이 한 프로젝트를 같이 한다.
    - A 는 데이터베이스와 관련된 기능을 구현.
    - B 는 웹 프로그래밍과 관련된 기능 구현
    - 원래대로라면 A 끝나고 결과코드를 B에 넘겨주고 B는 그걸 받아서 일한다.
    - 하지만 이것은 비효율적이다. 이유는 에러도 더 날 수 있고 동시에 얼마든지 일 할 수 있다.
    - BangMyungDAO_KaraImpl : DB 연동을 비슷하게 흉내내준다.
       		add를 이용해서 레코드를 쌓고, findAll 로 쌓인 레코드를 출력 가능하다.
    - B 는 BangMyungDAO_KaraImpl 을 이용해서 작업에 착수한다. 동시에
    - A 는 BangMyungDAO_OracleImpl 을 구현한다. (jdbc 코드 작성)
    - 양쪽이 다 테스트가 끝나서 통합에 들어간다. 매우 간단함. 

    

    **결론**

    - "데이터를 다루는 코드를 독립된 클래스로 만들되 그 작업들을 추상화한 인터페이스를 기반으로 만드는 설계 기법을 DAO pattern이라고 한다."

    

    **DAO를 이용한 구현**

    class : BangMyung2List

    ```java
    package study2;
    
    import java.io.IOException;
    import java.io.PrintWriter;
    import java.util.List;
    
    import javax.servlet.ServletException;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    
    // /bangmyung_list 로 요청이 들어오면 보여지게 세팅해 보자.
    public class BangMyung2List extends HttpServlet {
    
    	@Override
    	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    		System.out.println("BangMyung2List");
    		BangMyungDAO dao = new BangMyungDAO_KaraImpl();
    		List<BangMyungVO> ls = null;
    		try {
    			ls = dao.findAll();
    		} catch (Exception e) {
    
    			
    		}
    		resp.setContentType("text/html;charset=euc-kr");
    		PrintWriter out = resp.getWriter();
    		out.println("<html>");
    		out.println("	<body>");
    		out.println("		<table border=\"0\" cellspacing=\"2\" cellpadding=\"12\">");
    		
    		int i = 0;
    		for (BangMyungVO vo : ls) {
    			String color = ((++i % 2) == 0) ? "#aabbcc" : "#ccddee";
    			out.println("			<tr>");
    			out.println("				<td bgColor='" + color + "'>");
    			out.println(vo.getNo());
    			out.println("				</td>");
    			out.println("				<td bgColor='" + color + "'>");
    			out.println(vo.getGul());
    			out.println("				</td>");
    			out.println("				<td bgColor='" + color + "'>");
    			out.println(vo.getTheTime());
    			out.println("				</td>");
    			out.println("			</tr>");
    		}
    		out.println("		<table>");
    
    		/*
    		 * <form method=\"POST\" action=\"bangmyung_add2\"> <input
    		 * type=\"text\" name=\"\" size=\"50\"/> <input type=\"submit\"/> </form>
    		 */
    		out.println("<form method=\"POST\" action=\"bangmyung_add2\">");
    		out.println("<input type=\"text\" name=\"gul\" size=\"50\"/>");
    		out.println("<input type=\"submit\"/>");
    		out.println("</form>");
    
    		out.println("	</body>");
    		out.println("</html>");
    		out.close();
    	}
    
    }
    ```

    class : BangMyung2Add2

    ```java
    package study2;
    
    import java.io.IOException;
    
    import javax.servlet.ServletException;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    
    public class BangMyung2Add2 extends HttpServlet {
    
    	@Override
    	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		System.out.println("BangMyung2Add2");
    		String gul = request.getParameter("gul");
    		BangMyungVO vo = new BangMyungVO();
    		vo.setGul(gul);
    		BangMyungDAO dao = new BangMyungDAO_KaraImpl();
    		try {
    			dao.add(vo);
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
    		response.sendRedirect("/study2/bangmyung_list");
    	}
    
    }
    
    ```

--------

* **중요**)  여러 사람이 한 사이트에 접속할 때 발생할 수 있는 위험에 대처하기

  1. 되도록 변수를 멤버변수를 두기보다 로컬변수로 두기

  2. synchronized의 사용 : 하나의 서블릿 인스턴스에 대해 한 번에 많은 thread가 접근하지 못하도록 막아준다. 아래는 이에 대한 예제 코드.

     class : LifeServlet

     ```java
     package study3;
     
     import java.io.IOException;
     import java.io.PrintWriter;
     
     import javax.servlet.ServletException;
     import javax.servlet.http.HttpServlet;
     import javax.servlet.http.HttpServletRequest;
     import javax.servlet.http.HttpServletResponse;
     
     /*
      	많은 사람들이 동시에 접속해도 동일한 문자열이 계속 찍힌다.
      	-> 동일한 인스턴스가 계속 재사용되고 있다. 메모리 관리에서는 장점이다.
      	-> 한꺼번에 많이 들어와도 적게 메모리를 소모한다.
      	
      */
     public class LifeServlet extends HttpServlet {
     	int i = 0;// 전역변수 멤버함수
     
     	@Override
     	protected void service(HttpServletRequest request, HttpServletResponse response)
     			throws ServletException, IOException {
     		System.out.println(this.toString());// 하나의 인스턴스가 재활용됨을 볼 수 있다.
     
     		// 하지만 여러 사람이 동시에 접속하면 여러개의 스레드에 의해 하나의 서블릿 인스턴스가 공유된다.
     		// 해결방법은 첫 번째 로컬 변수만 쓰는 법, 두 번째 동기화(synchronized)
     		PrintWriter out = response.getWriter();
     		out.println("<html><body>");
     		
     		// 왜 synchronized 가 필요할까?
     		// 동시 요청시 여러개의 쓰레드가 하나의 서블릿 인스턴스를 사용할 수 있다.
     		synchronized (this) {
     			i = i + 1;
     			for (int j = 0; j < 500000; j++) {
     				out.println(i);
     			}
     		}
     		out.println("</body></html>");
     		out.flush();
     		out.close();
     	}
     
     }
     ```

* **중요**) HttpServlet 클래스의 init의 동작 방식과 다운로드 파일이 있다면 저장되는 곳이 어디며 어떤식으로 하면 될까? 그리고 web.xml 파일에 내용을 읽어들일 수 있을까?

  ```java
  ...생략...
      /*
  	 * 서블릿의 인스턴스는 재활용된다.
  	 * 인스턴스는 재활용을 위해 내부적으로 적재되는데, 적재되는 시점에 호출되는 함수가
  	 init - 최초 요청시에만 호출된다.
  	 */
      @Override
  	public void init(ServletConfig config) throws ServletException {
  		System.out.println("init");
  
  		// web.xml 에 설정된 내용을 읽어들일 수 있는 방법을 제공한다.
  		System.out.println(config.getInitParameter("apple"));
  
  		/*
  		 WEB-INF 폴더의 절대경로값을 얻어온다. 브라우저가 접근 못하는 폴더가 업로드
  		 파일을 놓기에 가장 적합하다. 허락 받고 (돈내고) 다운 받을때 FileInputStream
           으로 읽어 내보낸다. 그 때 FileInputStream 은 절대 경로를 필요로 한다. 
           그 경우에 getRealPath 는 유용하게 사용된다.
  		 */
  		ServletContext application = config.getServletContext();
  		String path = application.getRealPath("/WEB-INF/");
  		System.out.println(path);
  	}
  
  	/* web.xml에서 는 이렇게 param 설정이 되어있음
  	 * <servlet> <servlet-name>abcd6</servlet-name>
  	 * <servlet-class>study3.ConfigServlet</servlet-class> <init-param>
  	 * <param-name>apple</param-name> <param-value>blabla</param-value>
  	 * </init-param> </servlet>
  	 * 
  	 * <servlet-mapping> <servlet-name>abcd6</servlet-name>
  	 * <url-pattern>/config</url-pattern> </servlet-mapping>
  	 */
  ```

* **중요**) HttpServlet service메서드에서의 여러가지 request 

  ```java
  ...생략...
      @Override
  	protected void service(HttpServletRequest request, HttpServletResponse response)
  			throws ServletException, IOException {
  		System.out.println("service");
  
  		// 컨텍스트 경로
  		String l = request.getContextPath();
  		System.out.println("getContextPath : " + l);
  
  		// IP 주소 다음 나오는 전체경로
  		String m = request.getRequestURI();
  		System.out.println("getRequestURI : " + m);
  
  		// 접속한 브라우저의 IP 주소 값
  		String g = request.getRemoteAddr();
  		System.out.println("getRemoteAddr : " + g);
  
  		/*
  		 접속한 브라우저와 운영체제 정보를 담은 문자열이 얻어진다. 
  		 이것을 이용하여 모바일로 접근한건지 컴으로 접근한 건지 알 수 있고
  		 모바일용 화면과 컴퓨터용 화면을 구분하여 제공할 수도 있다.
  		 */
  		String o = request.getHeader("User-Agent");
  		System.out.println("getHeader " + o);
  	}
  ```

------------------------

### 14일차 학습 내용

* 테이블에 insert할 때 null일 경우 주의해야 할 상황

  class : Test_110

  ```java
  package main;
  
  import java.sql.Connection;
  import java.sql.DriverManager;
  import java.sql.Statement;
  
  public class Test_110 {
  
  	public static void main(String[] args) throws Exception {
  //		String data = "xyz";
  		String data = null;
  		Class.forName("oracle.jdbc.driver.OracleDriver");
  		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "HR");
  
  		// sql 이어 붙일 때 ''에 주의한다.
  		// data 에 null일 때는 에러난다 왜? null이라는 문자열이 들어가기 때문 문자열 크기는 3까지임.
  		// 나름 해결책이지만 null 가능 필드가 2개 이상이면 답이 없음.
  		
  		//이런 문제 때문에 현업에서는 PreparedStatement를 더 선호한다.
  		// 현업에서는 아예 char는 무조건 4자리 이상을 잡게 하는 경우도 있다.
  		String sql = (data != null) ? "insert into temp20t values ('" + data + "')"
  				: "insert into temp20t values (null)";
  		Statement stmt = conn.createStatement();
  		stmt.executeUpdate(sql);
  
  		stmt.close();
  		conn.close();
  	}
  
  	/*
  	 * create table temp20t( data char(3) null );
  	 * 
  	 * insert into temp20t values ('abc'); insert into temp20t values (null);
  	 * 
  	 * Q. null 4글자가 입력가능 ? - null은 빈값을 의미하므로 insert해도 안보임 - 'null'은 안들어감 3글자까지만 입력
  	 * 가능. - null과 null 은 구분하자.
  	 * 
  	 * select * from temp20t where data = null; 데이터가 null인 걸 찾을 때 이런식으로 쓰지 않는다.
  	 * null값을 찾을 때는 = null이 아닌 is null로 찾자.
  	 */
  }
  ```

  위와 같은 상황에서 대처하는 방법 : **PrepareStatement**의 사용

  class : Test_111

  ```java
  package main;
  
  import java.sql.Connection;
  import java.sql.DriverManager;
  import java.sql.PreparedStatement;
  
  public class Test_111 {
  
  	public static void main(String[] args) throws Exception {
  
  		Class.forName("oracle.jdbc.driver.OracleDriver");
  		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "HR");
  
  		String sql = "insert into temp20t values (?)";// 딱 이런 문장만 입력으로 받음.
  		
  		//그냥 Statement를 쓸 때랑 구조가 약간 다름! 
  		
  		/*
  		 	Statement 가 어떤 sql 문장이든 실행하는 범용적인데 반해서
  		 	PreparedStatement 는 생성시에 준비한 그 문장만 실행할 수 있다.
  		 	대신 ? 영역을 setString, setInteger 등을 이용하여 채울 수 있다.
  		 	(순서가 1 부터 시작하는 것에 유의)
  		 	
  		 	execute 시에 매개변수 없음에 주의.
  		 	
  		 	이걸 쓰면 null 값을 넣을 때 '' 를 붙여야 할지를 결정하기 위해 이런 저런
  		 	고민할 필요가 없어진다. (Test110 참고)
  		 */
  		PreparedStatement stmt = conn.prepareStatement(sql);
  		stmt.setString(1, null);
  		stmt.executeUpdate();
  		stmt.close();
  		conn.close();
  	}
  
  }
  ```

--------------------

* 가변 파라미터로 만들어진 메서드의 사용

  class : Test_112 : auto boxing, un boxing , instanceof 의 사용

  ```java
  package main;
  
  public class Test112 {
  	// 가변 파라미터 함수 선언 방법... 0..*
  	// 실은 String...은 String[]과 동일하다.
  	//
  	public static void test(String... args) {
  
  	}
  
  	public static void test2(Object... args) {
  		for (int i = 0; i < args.length; i++) {
  			if (args[i] == null) {
  				System.out.println("null");
  			} else if (args[i] instanceof Integer) {
  				int r = ((Integer) args[i]).intValue();
  				System.out.println(r + 1);
  			} else if (args[i] instanceof Double) {
  				double r = ((Double) args[i]).doubleValue();
  				System.out.println(r + 0.1);
  			} else if (args[i] instanceof String) {
  				System.out.println((String) args[i]);
  			}
  		}
  	}
  
  	// Object arg_1 = 100; => 100을 new Integer(100)로 자동변환 오토박싱
  	// Object arg_2 = 3.14; => 3.14를 new Doublce(3.14)로 자동변환
  	// Object arg_2 = null;
  	public static void main(String[] args) {
  		test2(100, "", 3.14, null);
  
  		test("apple");
  		test();
  		test("apple", "banana");
  
  	}
  	/*
  	 * [ 개념복습 ] 
  	 * Object i = 100(O) 오토 박싱 
  	 * int j = i (X)
  	 * 
  	 * Integer i = 100(O) 언 박싱 
  	 * int j = i (O)
  	 */
  
  }
  ```

------------------

* Test_113~114 , stateServlet , SessionServlet 정리 못함... 시간나면 하자.. 정리할 시간이 없었음
* jsp도 ~ 115와 JSPServlet같이 내용 정리 ㄴ

* jsp 116_0* 정리하기
* 117 JSP로 랜덤컬러구구단 만들기 했음.
* 방명 리스트 & add jsp로 구현하기
* 에러페이지 만들기
* 
* 

----------------

### 15일차 학습 내용

* Util, 
* 채팅방 만들기 예제 talkRoomVO , talkVO,많은 jsp...
* 한글 안깨지게 하는 방법
* 채팅 지우기, 추가하기 
* test118~ ${} 의 사용
* EL과 연동되는 jstl 120~121 bangmyung_list.jsp를 jstl로 다시 구현

-------------------

### 16일차 학습 내용

* Test122~file 서버에 업로드~ FileUpServlet 

  * cos.jar 의 사용 multipartrequest
  * init getRealPath

  * FileDownServlet

* forward

* MVC모델 -> 스프링 구현?

  디스페쳐는 핸들리퀘스트를 호출하고 스트링을 리턴 받는다.
  그 스트링에 따라 리다이렉트가 될지 포워드가 될지 결정 됨.
  forward는 무조건 do로(model2)

* 매 JSP 마다 에러페이지로 가는 로직을 안만들어도 된다..

* Test126.jsp,java URL.. 암호처리 , jar파일 추가

----------

### 17일차 학습 내용

* Test127~
* jar파일 추가 log4j관련 jar , log4j_test.jsp(에러안나는정도), Test127.jsp
*   

 