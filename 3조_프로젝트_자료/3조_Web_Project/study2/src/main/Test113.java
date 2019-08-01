package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test113 {
	public static int update(String sql, Object... args) throws Exception {

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "HR");

		PreparedStatement stmt = conn.prepareStatement(sql);

		for (int i = 0; i < args.length; i++) {
			if (args[i] == null) {
				stmt.setObject(i + 1, null);
			} else if (args[i] instanceof Integer) {
				int r = ((Integer) args[i]).intValue();
				stmt.setInt(i + 1, r);
			} else if (args[i] instanceof Double) {
				double r = ((Double) args[i]).doubleValue();
				stmt.setDouble(i + 1, r);
			} else if (args[i] instanceof String) {
				stmt.setString(i + 1, (String) args[i]);
			}
		}
		int rc = stmt.executeUpdate();
		stmt.close();
		conn.close();

		return rc;
	}

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		String sql = "insert into temp20t values (?)";
		update(sql, "KIM");
	}

}
