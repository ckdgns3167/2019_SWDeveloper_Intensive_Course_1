import java.sql.*;

public class Test103_jdbc_close의_안전한처리 {
	
	/*
	 	executeUpdate 상황에서 에러나도 conn.close() 는 되어야 한다??? 무조건 되야 한다..비싼자원이야 아껴야해...
	 	finally 영역은 try 영역에서 에러가 나건 안나건 무조건 실행한다. 이것을 이용한다.
	 	: stmt.close() conn.close() 를 finally에 옮긴다. 그런데 이것도 그냥 옮겨두면 완벽하지 않다.
	 	 커넥션할 때 에러가 날 수도 있기때문에 그때는 참조형 변수가 가리킬게 없어 null
	 	이므로 null이 아닐때 실행되도록 해야한다. 안전하게 ~ 
	 */
	
	public static void addGul(String gul) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "HR");
			stmt = conn.createStatement();
			String sql = "insert into bangmyung_t values (seq_bangmyung.nextval, '" + gul + "', sysdateXX)";
			stmt.executeUpdate(sql);// 이거 실행할 때 에러남
		} catch (Exception e) {
			throw e; //안전한 방법.
		} finally {// try{}에서 에러가 나건 안나건 무조건 거친다.
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
			System.out.println("All closed!");
		}
	}

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		Class.forName("oracle.jdbc.driver.OracleDriver");
		addGul("Hi");
	}

}
