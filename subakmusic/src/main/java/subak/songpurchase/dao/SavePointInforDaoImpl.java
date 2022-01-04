package subak.songpurchase.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.songpurchase.model.SongPurchaseVO;

public class SavePointInforDaoImpl extends SqlMapClientDaoSupport implements SavePointInforDao{

	@Override
	public void savaPointInfor(SongPurchaseVO songpurchasevo) {
		
	
	songpurchasevo.setUsesave("U");	
	
	if(songpurchasevo.getPurchasetype().equals("download")){
	songpurchasevo.setPoint(500);
	songpurchasevo.setNote("다운로드, 500포인트를 사용하셨습니다.");
	getSqlMapClientTemplate().insert("savememberpointSql.savePointInfor",songpurchasevo);
	}
	
	else{
	songpurchasevo.setPoint(300);
	songpurchasevo.setNote("음악듣기, 300포인트 사용하셨습니다.");
	getSqlMapClientTemplate().insert("savememberpointSql.savePointInfor",songpurchasevo);
	}

	
	
}

}