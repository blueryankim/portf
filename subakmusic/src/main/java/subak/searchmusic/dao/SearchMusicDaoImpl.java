package subak.searchmusic.dao;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.searchmusic.model.SearchMusicVO;

public class SearchMusicDaoImpl extends SqlMapClientDaoSupport implements SearchMusicDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<SearchMusicVO> searchMusicList(Object obj) {
		Map<String,Object> map=(Map<String,Object>)obj;
		if(map.get("searchtype").equals("singer"))
		{
			return getSqlMapClientTemplate().queryForList("searchmusicSql.searchSingerList",obj);
			
		}
		else
		{	
			return getSqlMapClientTemplate().queryForList("searchmusicSql.searchSongNameList",obj);
		}
		
	}

	@Override
	public int searchMusicCount(Object obj) {
		
		@SuppressWarnings("unchecked")
		Map<String,Object> map=(Map<String,Object>)obj;
		
		if(map.get("searchtype").equals("singer"))
		{
			return ((Integer)getSqlMapClientTemplate().queryForObject("searchmusicSql.searchMusicSingerCount",obj)).intValue();
		}
		else
		{	
			return ((Integer)getSqlMapClientTemplate().queryForObject("searchmusicSql.searchMusicSongNameCount",obj)).intValue();
		}

	
	
}

}