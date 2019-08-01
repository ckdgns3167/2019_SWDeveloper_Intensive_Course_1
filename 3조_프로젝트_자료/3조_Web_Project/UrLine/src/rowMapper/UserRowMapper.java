package rowMapper;

import java.sql.ResultSet;
import template.RowMapper;
import vo.UserVO;

public class UserRowMapper implements RowMapper {

	@Override
	public UserVO mapRow(ResultSet rs) throws Exception {
		UserVO vo = new UserVO();
		vo.setUserNo(rs.getInt(1));
		vo.setId(rs.getString(2));
		vo.setPw(rs.getString(3));
		vo.seteMail(rs.getString(4));
		vo.setPhone(rs.getString(5));
		vo.setNickname(rs.getString(6));
		vo.setPoint(rs.getInt(7));
		vo.setGrade(rs.getInt(8));
		return vo;
	}

}
