package subak.songpurchase.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.songpurchase.model.SongPurchaseVO;

public class UpdateClickCountDaoImpl extends SqlMapClientDaoSupport implements UpdateClickCountDao {

	
	@Override
	public void updateClickCount(SongPurchaseVO songpurchasevo) {
		
		if(songpurchasevo.getPurchasetype().equals("download")){
		getSqlMapClientTemplate().update("updateclickcountSql.updateDownloadCount",songpurchasevo);	
		}
		if(songpurchasevo.getPurchasetype().equals("play")){
		System.out.println("why don't you work?");
		getSqlMapClientTemplate().update("updateclickcountSql.updatePlayCount",songpurchasevo);	
		}
	}

	

}
