package main;

import study2.BangMyungDAO;
import study2.BangMyungDAO_OracleImpl;
import study2.BangMyungVO;

public class Test_108 {

	public static void main(String[] args) {
		BangMyungDAO dao = new BangMyungDAO_OracleImpl();

		BangMyungVO vo = new BangMyungVO();
		vo.setGul("HelloWorld");
		try {
			dao.add(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
