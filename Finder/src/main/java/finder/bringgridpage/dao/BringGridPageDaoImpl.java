package finder.bringgridpage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import finder.bringgridpage.model.BringGridPageVO;

public class BringGridPageDaoImpl extends SqlMapClientDaoSupport implements BringGridPageDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<BringGridPageVO> bringGridPage(String flag) {
	
			
		if(flag=="albumgrid" || flag.equals("albumgrid"))
		return getSqlMapClientTemplate().queryForList("bringgridpageSql.getGridAlbumList");
		
		else if(flag=="bookgrid" || flag.equals("bookgrid"))
		return getSqlMapClientTemplate().queryForList("bringgridpageSql.getGridBookList");
		
		else
		return getSqlMapClientTemplate().queryForList("bringgridpageSql.getGridWritingList");
	}
	
	@SuppressWarnings("unchecked")
	public List<BringGridPageVO> bringGridContents(Object obj){
		
		String flag;
		Map<String,Object> map=new HashMap<String,Object>();
		map=(Map<String,Object>)obj;
		flag=(String)map.get("flag");
		
		if(flag=="albumgrid" || flag.equals("albumgrid"))
			return getSqlMapClientTemplate().queryForList("bringgridpageSql.getGridAlbumList2",obj);
			
		else if(flag=="bookgrid" || flag.equals("bookgrid"))
			return getSqlMapClientTemplate().queryForList("bringgridpageSql.getGridBookList2",obj);
			
		else
			return getSqlMapClientTemplate().queryForList("bringgridpageSql.getGridWritingList2",obj);
		
		
		
	}
	

	@Override
	public int getMyAlbumCount(String id) {
	
		return ((Integer)(getSqlMapClientTemplate().queryForObject("bringgridpageSql.getMyAlbumCount",id))).intValue();

	}

	@Override
	public int getMyBookCount(String id) {
		
		return ((Integer)(getSqlMapClientTemplate().queryForObject("bringgridpageSql.getMyBookCount",id))).intValue();

	}

	@Override
	public int getMyWritingCount(String id) {
		
		return ((Integer)(getSqlMapClientTemplate().queryForObject("bringgridpageSql.getMyWritingCount",id))).intValue();

	}

}
