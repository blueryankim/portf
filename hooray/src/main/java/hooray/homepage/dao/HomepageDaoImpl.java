package hooray.homepage.dao;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import hooray.homepage.model.HomepageVO;

public class HomepageDaoImpl extends SqlMapClientDaoSupport  implements HomepageDao {

	@SuppressWarnings("unchecked")
	public List<HomepageVO> getHomeHotList(){
	return getSqlMapClientTemplate().queryForList("HomepageSql.getHomeHotList");
	}
	
	@SuppressWarnings("unchecked")
	public List<HomepageVO> getHomeNewList(){
	return getSqlMapClientTemplate().queryForList("HomepageSql.getHomeNewList");	
	}
}
