package com.urline.dao;


import com.urline.rowMapper.PostingRowMapper;
import com.urline.template.JdbcTemplate;
import com.urline.vo.PostVO;

import java.util.List;


public class PostDAO {
    private static PostDAO instance;
    private JdbcTemplate jdbcTemplate = null;


    public PostDAO() {
        this.jdbcTemplate = new JdbcTemplate();
    }

    public static PostDAO getInstance() {
        if (instance == null)
            instance = new PostDAO();
        return instance;
    }

    public void insertPost(String sql, Object... args) throws Exception {
        jdbcTemplate.update(sql, args);
    }

    public void deletePost(String sql, Object... args) throws Exception {
        jdbcTemplate.update(sql, args);
    }

    public void updatePost(String sql, Object... args) throws Exception {
        jdbcTemplate.update(sql, args);
    }

    public PostVO selectOnePost(String sql, Object... args) throws Exception {
        PostingRowMapper urm = new PostingRowMapper();
        return (PostVO) jdbcTemplate.queryForObject(sql, urm, args);
    }

    public List<PostVO> selectAllPost(String sql, Object... args) throws Exception {
        PostingRowMapper urm = new PostingRowMapper();
        return jdbcTemplate.query(sql, urm, args);
    }
}
