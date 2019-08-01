package study2;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/*
 	데이터를 다루는 클래스는 독립시켜서 만드는 경향이 있다. (별도의 클래스)
 	A 는 데이터베이스와 관련된 기능을 구현.
 	B 는 데이터베이스와 무관한 기능을 구현. 웹프로그래밍과 관련한 기능 구현
 	
 	원래대로라면 A 끝나고 결과코드를 B에 넘겨주고 B는 그걸 받아서 일한다. 하지만 이것은 비효율적이다. 
 	이유는 에러도 더 날 수 있고 동시에 얼마든지 일 할 수 있다.
 	
 	
 	BangMyungDAO_KaraImpl : DB 연동을 비슷하게 흉내내준다.
 		add를 이용해서 레코드를 쌓고, findAll 로 쌓인 레코드를 출력 가능하다. 
 		
 	B 는 BangMyungDAO_KaraImpl 을 이용해서 작업에 착수한다. 동시에
 	A 는 BangMyungDAO_OracleImpl 을 구현한다. (jdbc 코드 작성)
 	
 	양쪽이 다 테스트가 끝나서 통합에 들어간다. 매우 간단함. 
 	
 	"데이터를 다루는 코드를 독립된 클래스로 만들되 그 작업들을 추상화한 인터페이스를 기반으로 만드는 설계 기법을 DAO pattern이라고 한다."
 */
public class BangMyungDAO_KaraImpl implements BangMyungDAO {// 데이터 베이스 없이 돌아가는 DAO를 구축해놓은 클래스...!!

	private static List<BangMyungVO> data = new ArrayList<BangMyungVO>();// DB를 흉내내는 것
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
