package dao;

import java.util.List;

import vo.PostingVO;

public abstract class PostingDAO {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521/XE";
	public static final String ID = "HR";
	public static final String PW = "HR";

	public abstract void insert(PostingVO vo) throws Exception;
	
	public abstract List<PostingVO> findAll() throws Exception;
	
}
