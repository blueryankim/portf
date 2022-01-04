package hooray.project.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class PlusCountDaoImpl extends SqlMapClientDaoSupport implements PlusCountDao{

	@Override
	public void plusCount(int projectNum) {
		getSqlMapClientTemplate().update("projectSql.plusProjectCount",projectNum);

		
	}

}
