package template;

import java.sql.PreparedStatement;

public interface PreparedStatementCallback<T extends Object> {
	public T doInStatement(PreparedStatement stmt) throws Exception;
}
