package finder.checkid.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class CheckIdDaoImpl extends SqlMapClientDaoSupport implements CheckIdDao {

	@Override
	public int checkId(String id) {
		
		return ((Integer) getSqlMapClientTemplate().queryForObject(
				"checkIdSql.idCheckCount",id)).intValue();
		
	
		
	}
	
	

}
