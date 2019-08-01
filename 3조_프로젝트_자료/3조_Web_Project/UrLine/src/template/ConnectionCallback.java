package template;

import java.sql.Connection;

public interface ConnectionCallback<T extends Object> {
	public T doInConnection(Connection con) throws Exception;
}
