package circle.ilikeit.dao;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import circle.ilikeit.model.ILikeItVO;

public class ILikeItDaoImpl extends SqlMapClientDaoSupport implements ILikeItDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<ILikeItVO> getLikingList(int timelinenum) {
		
		return getSqlMapClientTemplate().queryForList("ilikeitSql.getLikingList",timelinenum);
	}

	@Override
	public void setLikingInfor(ILikeItVO ilv) {
		getSqlMapClientTemplate().update("ilikeitSql.setLikingInfor",ilv);
		
	}

	@Override
	public String getName(String id) {
		return (String)getSqlMapClientTemplate().queryForObject("ilikeitSql.getName",id);
	}
	
	

}
