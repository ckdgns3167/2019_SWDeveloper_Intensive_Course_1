package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test_111 {

	public static void main(String[] args) throws Exception {

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/XE", "HR", "HR");

		String sql = "insert into temp20t values (?)";// �� �̷� ���常 �Է����� ����.
		
		//�׳� Statement�� �� ���� ������ �ణ �ٸ�! 
		
		/*
		 	Statement �� � sql �����̵� �����ϴ� �������ε� ���ؼ�
		 	PreparedStatement �� �����ÿ� �غ��� �� ���常 ������ �� �ִ�.
		 	��� ? ������ setString, setInteger ���� �̿��Ͽ� ä�� �� �ִ�.
		 	(������ 1 ���� �����ϴ� �Ϳ� ����)
		 	
		 	execute �ÿ� �Ű����� ������ ����.
		 	
		 	�̰� ���� null ���� ���� �� '' �� �ٿ��� ������ �����ϱ� ���� �̷� ����
		 	����� �ʿ䰡 ��������. (Test110 ����)
		 */
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, null);
		stmt.executeUpdate();
		stmt.close();
		conn.close();
	}

}
