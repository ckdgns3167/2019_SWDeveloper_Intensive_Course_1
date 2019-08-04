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

		String dbPW = ""; // db���� ���� ��й�ȣ�� ���� ����
		int x = -1;

		try {
			// ���� - ���� �Էµ� ���̵�� DB���� ��й�ȣ�� ��ȸ�Ѵ�.
			conn = jdbcTemplate.makeConn();
			String sql ="SELECT pw FROM usert WHERE ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) // �Է��� ���̵� �ش��ϴ� ��� �������
			{
				dbPW = rs.getString("pw"); // ����� ������ �ִ´�.

				if (dbPW.equals(pw))
					x = 1; // �Ѱܹ��� ����� ������ ��� ��. ������ ��������
				else
					x = 0; // DB�� ��й�ȣ�� �Է¹��� ��й�ȣ �ٸ�, ��������
			} else {
				x = -1; // �ش� ���̵� ���� ���
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
	
	public int confrimId(String id) {//���̵� �ߺ��� �����ִ� �Լ�...
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
			if (rs.next()) // �Է��� ���̵� �ش��ϴ� ��� �������
			{
				x = -1; // �ش� ���̵� �̹� ������.
			} else {
				x = 1; // �ش� ���̵� ���� ���
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
