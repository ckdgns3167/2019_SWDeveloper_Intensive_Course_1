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
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "s");
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
