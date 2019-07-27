import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;


class StudentVO{
	private String stId = null;
	private String name = null;
	private String addr = null;//프로퍼티
	/*
		프로퍼티는 멤버변수를 이야기함.
		헌데 멤버변수는 getter/setter 를 이용하고 private 하게 선언.
	*/
	public String getStId(){return stId;}
	public void setStId(String i){stId = i;}
	public String getName(){return name;}
	public void setName(String i){name = i;}
	public String getAddr(){return addr;}
	public void setAddr(String i){addr =i;}
}
public class Test099_4_Mjdbc_VO의사용 {
	
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/study", "root", "1111");
		System.out.println(conn.getClass().getName());

		Statement stmt = conn.createStatement();
		/*
			O-R Mapping 규칙(Golden Rule, Rule Of Thumb)
			
			field -> property
			table -> class
			record -> instance
			
			왜 ArrayList가 적당할까?
			
			Connection은 살아있을 때 할 거 다해야하고,
			Connection은 빨리 끊어야 한다.
			이 두가지 조건을 아래 코드는 이상적으로
			구현하고 있다.
			
			VO : ValueObject 의 약자 - 값을 담는 객체
			- 테이블 구조와 동일하게 , 레코드 하나를 인스턴스에 담을 수 있는 역할을 하는 것!!!
			
			DTO : Data Transfer Object
			Entity 등을 사용하는 경우도 있는데 실은 다 같은 얘기.
			*/
		List<StudentVO> rl = new ArrayList<StudentVO>();
		String sql = "select stid, name, addr from studentt";
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()) {//몇번 돌지는 미리 알기 어렵다 -> List를 사용해야함 저장하려면 ... 근데 단순하게 쌓기만 하는구조이기에 ArrayList 쓰자
			StudentVO vo = new StudentVO();
			vo.setStId(rs.getString("stid"));
			vo.setName(rs.getString("name"));
			vo.setAddr(rs.getString("addr"));
			rl.add(vo);
		}
		rs.close();

		stmt.close();
		conn.close();//커넥션을 최대한 빨리 끊고 일처리를 하는 쪽으로 해야한다.
		
		//conn.close() 이후에도 List 안에는 결과가 담겨 있다...!!!!!
		for(StudentVO vo : rl) {
			System.out.println(vo.getStId()+'\t'+vo.getName()+"\t"+vo.getAddr());
		}
	}

}
