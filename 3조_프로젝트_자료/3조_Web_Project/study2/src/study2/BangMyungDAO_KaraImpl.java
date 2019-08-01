package study2;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/*
 	�����͸� �ٷ�� Ŭ������ �������Ѽ� ����� ������ �ִ�. (������ Ŭ����)
 	A �� �����ͺ��̽��� ���õ� ����� ����.
 	B �� �����ͺ��̽��� ������ ����� ����. �����α׷��ְ� ������ ��� ����
 	
 	������ζ�� A ������ ����ڵ带 B�� �Ѱ��ְ� B�� �װ� �޾Ƽ� ���Ѵ�. ������ �̰��� ��ȿ�����̴�. 
 	������ ������ �� �� �� �ְ� ���ÿ� �󸶵��� �� �� �� �ִ�.
 	
 	
 	BangMyungDAO_KaraImpl : DB ������ ����ϰ� �䳻���ش�.
 		add�� �̿��ؼ� ���ڵ带 �װ�, findAll �� ���� ���ڵ带 ��� �����ϴ�. 
 		
 	B �� BangMyungDAO_KaraImpl �� �̿��ؼ� �۾��� �����Ѵ�. ���ÿ�
 	A �� BangMyungDAO_OracleImpl �� �����Ѵ�. (jdbc �ڵ� �ۼ�)
 	
 	������ �� �׽�Ʈ�� ������ ���տ� ����. �ſ� ������. 
 	
 	"�����͸� �ٷ�� �ڵ带 ������ Ŭ������ ����� �� �۾����� �߻�ȭ�� �������̽��� ������� ����� ���� ����� DAO pattern�̶�� �Ѵ�."
 */
public class BangMyungDAO_KaraImpl implements BangMyungDAO {// ������ ���̽� ���� ���ư��� DAO�� �����س��� Ŭ����...!!

	private static List<BangMyungVO> data = new ArrayList<BangMyungVO>();// DB�� �䳻���� ��
	private static int no = 0;

	@Override
	public void add(BangMyungVO vo) throws Exception {
		vo.setNo(no++);
		Date now = new Date();
		vo.setTheTime(now.toString());
		data.add(vo);
	}

	@Override
	public List<BangMyungVO> findAll() throws Exception {
		return data;
	}

}
