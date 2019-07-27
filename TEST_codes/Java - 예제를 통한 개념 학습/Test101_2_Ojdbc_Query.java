import java.sql.*;

/*
 	Mysql의 코드와 거의 다른 점이 없다.
 	Connection, Statement 를 상속한 Oracle과 연동 가능한 클래스를 OracleDriver에서 
 	DriverManager에 세팅해 주면 Oracle에 맞추어 개발된 , Connection statement ResultSet 등을 
 	상속받은 클래스가 공급되는 구조이다.
 */

public class Test101_2_Ojdbc_Query {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "HR");
		System.out.println(conn.getClass().getName());// oracle.jdbc.driver.T4CConnection

		Statement stmt = conn.createStatement();

		// 오라클은 sysdate 마이에스큐엘은 now
		String sql = "SELECT SYSDATE FROM DUAL";
		ResultSet rs = stmt.executeQuery(sql);

		// 결과 레코드가 1개인 경우에는 while 대신에 if문을 사용하자 ㅎㅎㅎ
		while (rs.next()) {
			// 필드명 대신 숫자가 올 수 있다. 1은 셀렉트 절에 나열된 첫 번 째 프로퍼티를 의미
			String l = rs.getString(1);
			System.out.println(l);
		}
		rs.close();

		stmt.close();
		conn.close();
	}

}
