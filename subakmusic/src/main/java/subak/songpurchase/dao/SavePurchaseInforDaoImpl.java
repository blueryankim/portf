package subak.songpurchase.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.songpurchase.model.SongPurchaseVO;

public class SavePurchaseInforDaoImpl extends SqlMapClientDaoSupport implements
		SavePurchaseInforDao {

	@Override
	public void savePurchaseInfor(SongPurchaseVO songpurchasevo) {

		getSqlMapClientTemplate().insert(
				"savepurchaseinforSql.saveDownloadInfor", songpurchasevo);
	}

}
