package subak.linkmedia.dao;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.linkmedia.model.LinkMediaVO;

public class LinkMediaDaoImpl extends SqlMapClientDaoSupport implements LinkMediaDao{

	@SuppressWarnings("unchecked")
	@Override
	public List<LinkMediaVO> getLinkMediaList(Object obj) {
		Map<String,Object> map=(Map<String,Object>)obj;
		if(map.get("search_type").equals("popsong"))
		return getSqlMapClientTemplate().queryForList("linkmediaSql.getPopLinkMediaList",obj);
		else
		return getSqlMapClientTemplate().queryForList("linkmediaSql.getGayoLinkMediaLinst",obj);	
		}

	@Override
	public int getLinkMediaCount(Object obj) {
		@SuppressWarnings("unchecked")
		Map<String,Object> map=(Map<String,Object>)obj;
		if(map.get("search_type").equals("popsong"))
		return ((Integer)getSqlMapClientTemplate().queryForObject("linkmediaSql.getPopLinkMediaCount")).intValue();
		else
		return ((Integer)getSqlMapClientTemplate().queryForObject("linkmediaSql.getGayoLinkMediaCount")).intValue();
	}

	@Override
	public String getChoosedMediaAddr(int choosedmediaid) {
	
		return ((String)getSqlMapClientTemplate().queryForObject("linkmediaSql.getChoosedMediaAddr",choosedmediaid));
	}

	
	
}
