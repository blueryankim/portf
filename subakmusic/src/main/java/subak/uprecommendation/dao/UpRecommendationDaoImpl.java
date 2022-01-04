package subak.uprecommendation.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class UpRecommendationDaoImpl extends SqlMapClientDaoSupport implements UpRecommendationDao {

	@Override
	public void upRecommendation(int listnum) {
		getSqlMapClientTemplate().update("uprecommendationSql.upRecommendation",listnum);
		
	}

	@Override
	public int getRecomCount(int listnum) {
		
		return (Integer)getSqlMapClientTemplate().queryForObject("uprecommendationSql.getRecomCount",listnum);
	}

	
	
}
