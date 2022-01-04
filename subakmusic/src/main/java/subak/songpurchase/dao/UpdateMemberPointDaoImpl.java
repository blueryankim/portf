package subak.songpurchase.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.songpurchase.model.SongPurchaseVO;

public class UpdateMemberPointDaoImpl extends SqlMapClientDaoSupport implements UpdateMemberPointDao{

	
	@Override
	public void updateMemberPoint(SongPurchaseVO songpurchasevo) {
		getSqlMapClientTemplate().update("updatememberpointSql.updateMemberPoint",songpurchasevo);
		
	}

	

	
}
