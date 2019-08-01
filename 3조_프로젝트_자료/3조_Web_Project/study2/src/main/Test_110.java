package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Test_110 {

	public static void main(String[] args) throws Exception {
//		String data = "xyz";
		String data = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "HR");

		// sql 이어 붙일 때 ''에 주의한다.
		// data 에 null일 때는 에러난다 왜? null이라는 문자열이 들어가기 때문 문자열 크기는 3까지임.
		// 나름 해결책이지만 null 가능 필드가 2개 이상이면 답이 없음.
		
		//이런 문제 때문에 현업에서는 PreparedStatement를 더 선호한다.
		// 현업에서는 아예 char는 무조건 4자리 이상을 잡게 하는 경우도 있다.
		String sql = (data != null) ? "insert into temp20t values ('" + data + "')"
				: "insert into temp20t values (null)";
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);

		stmt.close();
		conn.close();
	}

	/*
	 * create table temp20t( data char(3) null );
	 * 
	 * insert into temp20t values ('abc'); insert into temp20t values (null);
	 * 
	 * Q. null 4글자가 입력가능 ? - null은 빈값을 의미하므로 insert해도 안보임 - 'null'은 안들어감 3글자까지만 입력
	 * 가능. - null과 null 은 구분하자.
	 * 
	 * select * from temp20t where data = null; 데이터가 null인 걸 찾을 때 이런식으로 쓰지 않는다.
	 * null값을 찾을 때는 = null이 아닌 is null로 찾자.
	 */
}
