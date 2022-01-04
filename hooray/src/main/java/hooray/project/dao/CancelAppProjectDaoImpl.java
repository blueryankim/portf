package hooray.project.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class CancelAppProjectDaoImpl extends SqlMapClientDaoSupport implements CancelAppProjectDao{

	@Override
	public void cancelAppProject(Object obj) {
		
		Map<String,Object> map=new HashMap<String,Object>();
		map=(Map<String,Object>)obj;
		
		getSqlMapClientTemplate().update("projectSql.minusCurrentPeople",obj);
		getSqlMapClientTemplate().delete("projectSql.cancelAppProject",obj);

		
	}

}
