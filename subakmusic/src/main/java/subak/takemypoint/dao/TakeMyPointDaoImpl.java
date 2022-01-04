package subak.takemypoint.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class TakeMyPointDaoImpl extends SqlMapClientDaoSupport implements TakeMyPointDao{

	@Override
	public int takeMyPoint(String id) {
	
		return ((Integer)getSqlMapClientTemplate().queryForObject("takemypointSql.takeMyPoint",id)).intValue();
	}

	
}
