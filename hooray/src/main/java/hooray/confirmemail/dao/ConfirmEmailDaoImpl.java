package hooray.confirmemail.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class ConfirmEmailDaoImpl extends SqlMapClientDaoSupport implements ConfirmEmailDao {

	@Override
	public int checkId(String id) {
		
		return ((Integer) getSqlMapClientTemplate().queryForObject(
				"confirmEmailSql.CheckCount",id)).intValue();
		
	
		
	}
	
	

}
