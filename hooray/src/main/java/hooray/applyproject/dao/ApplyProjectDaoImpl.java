package hooray.applyproject.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class ApplyProjectDaoImpl extends SqlMapClientDaoSupport implements ApplyProjectDao{
	

	@SuppressWarnings("unchecked")
	public int applyProject(Object obj){
		

		Map<String,Object> map=new HashMap<String,Object>();
		map=(Map<String,Object>)obj;
		int pnum=(int)map.get("pnum");
		

		
		if(map.get("owner")!=null){
	
		getSqlMapClientTemplate().insert("applyProjectSql.applyProject",obj);
		getSqlMapClientTemplate().insert("applyProjectSql.insertChatting",obj);
		
		}
		else{
			getSqlMapClientTemplate().insert("applyProjectSql.applyProject",obj);
			getSqlMapClientTemplate().insert("applyProjectSql.insertChatting",obj);
			getSqlMapClientTemplate().update("applyProjectSql.updatecurrentpeople",pnum);
		
		}
		return ((Integer) getSqlMapClientTemplate().queryForObject(
				"applyProjectSql.confirmApply",obj)).intValue();

		
	}

	@Override
	public int applyProjectBefore(Object obj) {
		
		return ((Integer) getSqlMapClientTemplate().queryForObject(
				"applyProjectSql.confirmApplyBefore",obj)).intValue();

	}

}
