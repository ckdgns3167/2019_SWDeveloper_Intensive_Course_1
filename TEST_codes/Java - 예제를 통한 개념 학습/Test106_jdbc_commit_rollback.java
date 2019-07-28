import java.sql.*;

public class Test106_jdbc_commit_rollback {
	/*
	 * conn을 통해서 executeUpdate 하면 LOG를 거쳐서 Table에 저장된다. 로그에 잠시 머물다 곧바로 반영된다. jdbc 는
	 * autoCommit을 지원한다. (즉, executeUpdate 시에 무조건 테이블에 곧바로 커밋이 자동으로 먹는다)
	 */
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "HR");

			conn.setAutoCommit(false);// 커밋을 자동으로 먹지 않도록 막은것이다. 수동으로 하도록 한것!
			stmt = conn.createStatement();

			stmt.executeUpdate("insert into test_tx values (101)");
			stmt.executeUpdate("insert into test_tx values (102)");
			stmt.executeUpdate("insert into test_tx values (103)");
			stmt.executeUpdate("insert into test_tx values (104)");
			conn.commit();// 로그를 테이블에 반영시키고 비운다.
		} catch (Exception e) {
			if (conn != null) {
				conn.rollback();
				throw e;
			}
		} finally {
			if (stmt != null)
				stmt.close();
			// conn.rollback();//로그를 비운다.
			if (conn != null)
				conn.close();
		}

	}

}
