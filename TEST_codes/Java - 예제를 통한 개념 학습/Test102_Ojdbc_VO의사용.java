
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

class BangMyungVO {
	private Integer no = null;
	private String gul = null;
	private String theTime = null;

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getGul() {
		return gul;
	}

	public void setGul(String gul) {
		this.gul = gul;
	}

	public String getTheTime() {
		return theTime;
	}

	public void setTheTime(String theTime) {
		this.theTime = theTime;
	}

}

public class Test102_Ojdbc_VO의사용 {
	public static void main(String[] args) throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "HR", "HR");
		Statement stmt = conn.createStatement();
		String sql = "select * from bangmyung_t";
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList<BangMyungVO> al = new ArrayList<BangMyungVO>();
		while (rs.next()) {
			BangMyungVO vo = new BangMyungVO();
			vo.setNo(rs.getInt("no"));
			vo.setGul(rs.getString("gul"));
			vo.setTheTime(rs.getString("the_time"));
			al.add(vo);
		}
		rs.close();
		stmt.close();
		conn.close();

		for (BangMyungVO a : al) {
			System.out.println(a.getNo() + "\t" + a.getGul() + "\t" + a.getTheTime());
		}

	}
}