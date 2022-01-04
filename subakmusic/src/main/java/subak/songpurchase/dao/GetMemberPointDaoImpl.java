package subak.songpurchase.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.songpurchase.model.SongPurchaseVO;

public class GetMemberPointDaoImpl extends SqlMapClientDaoSupport implements GetMemberPointDao {

	@Override
	public int getMemberPoint(SongPurchaseVO songpurchasevo) {
		
		return ((Integer)getSqlMapClientTemplate().queryForObject("getmemberpointSql.getMemberPoint",songpurchasevo)).intValue();
	}

	
}
