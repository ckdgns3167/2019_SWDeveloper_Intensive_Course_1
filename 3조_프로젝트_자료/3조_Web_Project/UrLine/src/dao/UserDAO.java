package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import rowMapper.UserRowMapper;
import template.JdbcTemplate;
import vo.UserVO;

public class UserDAO {
	private static UserDAO instance;
	private JdbcTemplate jdbcTemplate = null;

	public UserDAO() {
		this.jdbcTemplate = new JdbcTemplate();
	}

	public static UserDAO getInstance() {
		if (instance == null)
			instance = new UserDAO();
		return instance;
	}

	public void insertUser(String sql, Object... args) throws Exception {
		jdbcTemplate.update(sql, args);
	}

	public void deleteUser(String sql, Object... args) throws Exception {
		jdbcTemplate.update(sql, args);
	}

	public void updateUser(String sql, Object... args) throws Exception {
		jdbcTemplate.update(sql, args);
	}

	public UserVO selectOneUser(String sql, Object... args) throws Exception {
		UserRowMapper urm = new UserRowMapper();
		return (UserVO) jdbcTemplate.queryForObject(sql, urm, args);
	}

	public List<UserVO> selectAllUser(String sql, Object... args) throws Exception {
		UserRowMapper urm = new UserRowMapper();
		return jdbcTemplate.query(sql, urm, args);
	}

	public int loginCheck(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
		int x = -1;

		try {
			// 쿼리 - 먼저 입력된 아이디로 DB에서 비밀번호를 조회한다.
			conn = jdbcTemplate.makeConn();
			String sql ="SELECT pw FROM usert WHERE ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
			{
				dbPW = rs.getString("pw"); // 비번을 변수에 넣는다.

				if (dbPW.equals(pw))
					x = 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
				else
					x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
			} else {
				x = -1; // 해당 아이디가 없을 경우
			}

			return x;

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} 
	
	public int confrimId(String id) {//아이디 중복을 막아주는 함수...
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		try {
			conn = jdbcTemplate.makeConn();
			String sql ="SELECT id FROM usert WHERE ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
			{
				x = -1; // 해당 아이디가 이미 존재함.
			} else {
				x = 1; // 해당 아이디가 없을 경우
			}
			return x;
		}catch(Exception e) {
			throw new RuntimeException(e.getMessage());
		}finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

}
