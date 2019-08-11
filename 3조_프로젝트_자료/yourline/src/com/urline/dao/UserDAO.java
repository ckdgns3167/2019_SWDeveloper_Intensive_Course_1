package com.urline.dao;

import com.urline.rowMapper.UserRowMapper;
import com.urline.template.JdbcTemplate;
import com.urline.vo.UserVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

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
    //마이페이지에서 쓰일 것이여 ~
    public UserVO selectOneUser(String sql, Object... args) throws Exception {
        UserRowMapper urm = new UserRowMapper();
        return (UserVO) jdbcTemplate.queryForObject(sql, urm, args);
    }
    //관리자 아이디로 로그인 시 마이페이지 버튼대신 회원 관리 버튼이 있을 것이여 ~
    //그럼 거기에 모든 사용자의 정보를 테이블에 쫘악 보여주면 되겠지
    public List<UserVO> selectAllUser(String sql, Object... args) throws Exception {
        UserRowMapper urm = new UserRowMapper();
        return jdbcTemplate.query(sql, urm, args);
    }

    public int ID_PW_Check(String id, String pw) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String dbPW = "";
        int x = -1;

        try {
            conn = jdbcTemplate.makeConn();
            String sql = "SELECT pw,type FROM usert WHERE ID=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dbPW = rs.getString("pw");

                if (dbPW.equals(pw)) {
                    x = rs.getInt("type");
                } else
                    x = 0;
            } else {
                x = -1;
            }

            return x;

        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            closer(conn, pstmt);
        }
    }

    private void closer(Connection conn, PreparedStatement pstmt) {
        JdbcTemplate.closer(conn, pstmt);
    }

    public int confrimId(String id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int x = -1;
        try {
            conn = jdbcTemplate.makeConn();
            String sql = "SELECT * FROM usert WHERE ID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                x = -1;
            } else {
                x = 1;
            }
            return x;
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        } finally {
            closer(conn, pstmt);
        }
    }

    public Object getProperty(String id, String pr) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = jdbcTemplate.makeConn();
            String sql = "SELECT " + pr + " FROM usert WHERE ID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            Object x = null;
            if (rs.next()) {
                if (pr.equals("id") || pr.equals("name") || pr.equals("phone")||pr.equals("nickname")||pr.equals("pw")||pr.equals("profile"))//문자
                    x = rs.getString(1);
                else if (pr.equals("point") || pr.equals("grade") || pr.equals("sex"))//숫자
                    x = rs.getInt(1);
            }
            return x;
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        } finally {
            closer(conn, pstmt);
        }
    }
}
