
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import temp.BangMyungVO;

public class Test104_jdbc_findAll의_구현 {
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
			System.out.println("All closed!");
		}
		return al;

	}

	public static void main(String[] args) throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		List<BangMyungVO> al = findAll();
		for (BangMyungVO a : al) {
			System.out.println(a.getNo() + "\t" + a.getGul() + "\t" + a.getTheTime());
		}

	}
}