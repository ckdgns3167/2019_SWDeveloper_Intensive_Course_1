import java.util.List;

import temp.BangMyungDAO;
import temp.BangMyungVO;

public class Test105_jdbc_import의_사용 {
	public static void main(String[] args) throws Exception {
		BangMyungDAO.addGul("끝?");
		List<BangMyungVO> ls = BangMyungDAO.findAll();
		for (BangMyungVO a : ls) {
			System.out.println(a.getNo() + "\t" + a.getGul() + "\t" + a.getTheTime());
		}
	}
}
