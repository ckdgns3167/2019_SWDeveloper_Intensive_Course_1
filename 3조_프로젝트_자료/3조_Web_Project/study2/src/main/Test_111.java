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
