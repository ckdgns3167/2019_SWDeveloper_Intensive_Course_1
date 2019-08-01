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

		// sql �̾� ���� �� ''�� �����Ѵ�.
		// data �� null�� ���� �������� ��? null�̶�� ���ڿ��� ���� ���� ���ڿ� ũ��� 3������.
		// ���� �ذ�å������ null ���� �ʵ尡 2�� �̻��̸� ���� ����.
		
		//�̷� ���� ������ ���������� PreparedStatement�� �� ��ȣ�Ѵ�.
		// ���������� �ƿ� char�� ������ 4�ڸ� �̻��� ��� �ϴ� ��쵵 �ִ�.
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
	 * Q. null 4���ڰ� �Է°��� ? - null�� ���� �ǹ��ϹǷ� insert�ص� �Ⱥ��� - 'null'�� �ȵ� 3���ڱ����� �Է�
	 * ����. - null�� null �� ��������.
	 * 
	 * select * from temp20t where data = null; �����Ͱ� null�� �� ã�� �� �̷������� ���� �ʴ´�.
	 * null���� ã�� ���� = null�� �ƴ� is null�� ã��.
	 */
}
