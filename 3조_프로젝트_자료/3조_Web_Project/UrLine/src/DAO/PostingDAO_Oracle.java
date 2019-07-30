package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import VO.PostingVO;

public class PostingDAO_Oracle extends DAO {

	public void add(PostingVO vo) throws Exception {
		// TODO Auto-generated method stub
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, ID, PW);
			stmt = conn.createStatement();
			String sql = "";
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

	public List<PostingVO> findAll() throws Exception {
		List<PostingVO> ls = new ArrayList<PostingVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, ID, PW);
			stmt = conn.createStatement();
			String sql = "SELECT nickName, grade, title, region, postingDate, contents, b_hopefulPoint, state, requestTime, howMuch FROM USERT u, POST p WHERE u.userid = p.userid";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				PostingVO vo = new PostingVO();
				vo.setNickName(rs.getString(1));
				vo.setGrade(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setRegion(rs.getString(4));
				vo.setPostingDate(rs.getString(5));
				vo.setContents(rs.getString(6));
				vo.setB_hopefulPoint(rs.getInt(7));
				vo.setState(rs.getInt(8));
				vo.setRequestTime(rs.getString(9));
				vo.setHowMuch(rs.getString(10));
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
