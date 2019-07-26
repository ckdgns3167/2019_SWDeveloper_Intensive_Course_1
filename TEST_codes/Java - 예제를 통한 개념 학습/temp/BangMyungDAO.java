package temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BangMyungDAO {

	static {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {

		}
	}

	public static void addGul(String gul) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "HR");
			stmt = conn.createStatement();
			String sql = "insert into bangmyung_t values (seq_bangmyung.nextval, '" + gul + "', sysdate)";
			stmt.executeUpdate(sql);// 이거 실행할 때 에러남
		} catch (Exception e) {
			throw e; // 안전한 방법.
		} finally {// try{}에서 에러가 나건 안나건 무조건 거친다.
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
			System.out.println("addGul완료");
		}
	}

	public static List<BangMyungVO> findAll() throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<BangMyungVO> al = new ArrayList<BangMyungVO>();
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "HR", "HR");
			stmt = conn.createStatement();
			String sql = "select * from bangmyung_t";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				BangMyungVO vo = new BangMyungVO();
				vo.setNo(rs.getInt("no"));
				vo.setGul(rs.getString("gul"));
				vo.setTheTime(rs.getString("the_time"));
				al.add(vo);
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
			System.out.println("findAll완료");
		}
		return al;

	}

}
