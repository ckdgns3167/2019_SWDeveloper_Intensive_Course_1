import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Test099_3_Mjdbc_executeQuery {
	static {
		// 클래스가 로딩되는 시점에 호출된다.
		/*
		 * Connection, statement 모두 인터페이스다. DriverManager.getConnection 안에서는 Connection을
		 * 상속받은 모종의 클래스의 인스턴스를 리턴한다. 그것은 mySql에 접속할 수 있는 기능을 구현하고 있다.
		 * 
		 * 그 모종의 클래스를 세팅하는 코드가 Class.forName("com.mysql.jdbc.Driver");
		 */
	}

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/study", "root", "1111");
		System.out.println(conn.getClass().getName());

		Statement stmt = conn.createStatement();
		/*
		 	ResultSet은 CURSOR (select 결과)에 접근 가능한 정보.
		 	CURSOR 는 서버에 생긴다.
		 	
		 	Connection 이 닫힌 다음에서는 ResultSet은 사용 불가하다.
		 	(Connection닫기 전에 사용 끝나야 한다.)
		 	
		 	Connection은 대단히 비싼 자원이고 제한적인 자원이다. 
			따라서 접속후에 빨리 끊어주는게 바람직하다 (콜센터를 연상하면 된다.)
		 */
		String sql = "select stid, name, addr from studentt";
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()) {
			String stid = rs.getString("stid");
			String name = rs.getString("name");
			String addr = rs.getString("addr");
			System.out.println(stid + '\t' + name + "\t" + addr);
		}
		rs.close();

		stmt.close();
		conn.close();
	}

}
