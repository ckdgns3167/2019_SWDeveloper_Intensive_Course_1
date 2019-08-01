package template;

import java.sql.ResultSet;

public interface RowMapper<T extends Object> {
	public T mapRow(ResultSet rs) throws Exception;
}
