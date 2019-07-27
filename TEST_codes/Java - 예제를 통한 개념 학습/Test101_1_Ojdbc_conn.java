
import java.sql.*;

public class Test101_1_Ojdbc_conn {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "HR");

		Statement stmt = conn.createStatement();

		String gul = "HelloWorld";
		String sql = "insert into bangmyung_t values (seq_bangmyung.nextval, '" + gul + "', sysdate)";
		stmt.executeUpdate(sql);
		stmt.close();
		conn.close();
	}

}
