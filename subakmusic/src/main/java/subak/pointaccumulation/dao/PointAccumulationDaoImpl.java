package subak.pointaccumulation.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.pointaccumulation.model.PointAccumulationVO;

public class PointAccumulationDaoImpl extends SqlMapClientDaoSupport implements PointAccumulationDao {

	@Override
	public void pointAccumulation(PointAccumulationVO pointaccumulationvo) {
			getSqlMapClientTemplate().update("pointaccumulationSql.pointAccumulation",pointaccumulationvo);
	}

	@Override
	public int getMyPoint(String id) {
		return ((Integer)getSqlMapClientTemplate().queryForObject("pointaccumulationSql.getMyPoint",id)).intValue();
	}

	
}
