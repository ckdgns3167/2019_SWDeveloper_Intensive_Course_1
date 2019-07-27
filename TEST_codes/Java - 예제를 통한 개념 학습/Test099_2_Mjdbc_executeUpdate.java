import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Test099_2_Mjdbc_executeUpdate {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		Class.forName("com.mysql.jdbc.Driver");

		Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/study", "root", "1111");
		System.out.println(conn.toString());
		/*
			 Statement 는 conn줄을 타고 오가는 바구니를 연상하면 된다.
			 
			 executeUpdate 함수의 리턴값은 변경된 레코드의 갯수이다.
			 select는 레코드를 변경하지 않는다.
			 해서 executeUpdate 는 insert/ delete/ update 문장에 사용된다.
			 
			 conn.close() 신중하게 해야한다.(줄 끊기)
			 stmt.close() 도 신중하게 (바구니 내리는 거)
			 conn 형성 - stmt 형성 - 작업 - stmt.close() - conn.close()
			 이 순서를 지켜서 작업한다.
		 */
		Statement stmt = conn.createStatement();
		String sql = "insert into studentt values ('10107','asd','asd')";
		stmt.executeUpdate(sql);//update insert delete 같은 명령에 대해 변경된 레코드 수가 리턴됨.
		
		stmt.close();
		conn.close();

	}

}