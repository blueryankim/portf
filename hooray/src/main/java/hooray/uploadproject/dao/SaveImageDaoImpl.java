package hooray.uploadproject.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class SaveImageDaoImpl extends SqlMapClientDaoSupport implements SaveImageDao {

	@Override
	public int getProjectNum() {
		
		return (Integer) getSqlMapClientTemplate().queryForObject("uploadProjectSql.getProjectNum");
	}

}
