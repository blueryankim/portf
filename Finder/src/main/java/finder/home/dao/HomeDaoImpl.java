package finder.home.dao;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import finder.home.model.HomeVO;

public class HomeDaoImpl extends SqlMapClientDaoSupport implements HomeDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<HomeVO> getHomeAlbumList() {
	
		return getSqlMapClientTemplate().queryForList("homeSql.getHomeAlbumList");
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HomeVO> getHomeBookList() {

		return getSqlMapClientTemplate().queryForList("homeSql.getHomeBookList");
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HomeVO> getHomeWritingList() {
		
		return getSqlMapClientTemplate().queryForList("homeSql.getHomeWritingList");
	}

	@Override
	public int getMyAlbumCount(String id) {
	
		return ((Integer)(getSqlMapClientTemplate().queryForObject("homeSql.getMyAlbumCount",id))).intValue();

	}

	@Override
	public int getMyBookCount(String id) {
		
		return ((Integer)(getSqlMapClientTemplate().queryForObject("homeSql.getMyBookCount",id))).intValue();

	}

	@Override
	public int getMyWritingCount(String id) {
		
		return ((Integer)(getSqlMapClientTemplate().queryForObject("homeSql.getMyWritingCount",id))).intValue();

	}

	@Override
	public String getMyName(String id) {
		
		return (String)getSqlMapClientTemplate().queryForObject("homeSql.getMyName",id);

	}
	
	
	

}
