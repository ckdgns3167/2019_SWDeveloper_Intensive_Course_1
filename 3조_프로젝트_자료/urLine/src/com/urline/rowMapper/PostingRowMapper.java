package com.urline.rowMapper;

import com.urline.template.RowMapper;
import com.urline.vo.PostingVO;

import java.sql.ResultSet;

public class PostingRowMapper implements RowMapper {

	@Override
	public PostingVO mapRow(ResultSet rs) throws Exception {
		PostingVO vo = new PostingVO();
		vo.setPostNo(rs.getInt("postno"));
		vo.setId(rs.getString("id"));
		vo.setNickName(rs.getString("nickname"));
		vo.setGrade(rs.getInt("grade"));
		vo.setTitle(rs.getString("title"));
		vo.setRegion(rs.getInt("region"));
		vo.setPostingDate(rs.getString("postingdate"));
		vo.setContents(rs.getString("contents"));
		vo.setB_hopefulPoint(rs.getInt("b_hopefulpoint"));
		vo.setState(rs.getInt("state"));
		vo.setRequestTime(rs.getString("requesttime"));
		vo.setHowMuch(rs.getString("endtime"));
		vo.setProfile(rs.getString("profile"));
		return vo;
	}

}
