
import java.sql.Connection;
import java.sql.DriverManager;

public class Test099_1_Mjdbc_Connection {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		Class.forName("com.mysql.jdbc.Driver");// 스테틱 이니셜라이져 호출
		
		/*
		 	Connection 은 mysql에 소켓으로 접속하는 것과 관계 깊음.
		 	study : 데이터베이스명
		 	root / 1111 : 계정 및 암호
		 	
		 	127.0.0.1 : 네크워크 카드 밖으로 나가지 않고 나에게 접속 할때
		 */
		Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/", "root", "1111");
		System.out.println(conn.toString());
		conn.close();

	}
	// jar 파일은 클래스 파일을 압축해서 배포하는 파일!!
	// java -classpath .;mysql-connector-java-5.0.8-bin.jar Test099

}