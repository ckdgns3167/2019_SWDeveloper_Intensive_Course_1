package com.urline.rowMapper;

import com.urline.template.RowMapper;
import com.urline.vo.CommentVO;

import java.sql.ResultSet;

public class CommentRowMapper implements RowMapper {

	@Override
	public CommentVO mapRow(ResultSet rs) throws Exception {
		CommentVO vo = new CommentVO();
		vo.setUserNo(rs.getString("userno"));
		vo.setPostNo(rs.getInt("postedno"));
		vo.setCommentNo(rs.getInt("commentno"));
		vo.setwDate(rs.getString("wdate"));
		vo.setContents(rs.getString("comm"));
		vo.setSelected(rs.getInt("selected"));
		vo.setH_hopefulPoint(rs.getInt("h_hopefulpoint"));
		vo.setPhoneNo(rs.getString("phoneno"));
		return vo;
	}

}
