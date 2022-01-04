package subak.songpurchase.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.songpurchase.model.SongPurchaseVO;

public class SavePointInforDaoImpl extends SqlMapClientDaoSupport implements SavePointInforDao{

	@Override
	public void savaPointInfor(SongPurchaseVO songpurchasevo) {
		
	
	songpurchasevo.setUsesave("U");	
	
	if(songpurchasevo.getPurchasetype().equals("download")){
	songpurchasevo.setPoint(500);
	songpurchasevo.setNote("�ٿ�ε�, 500����Ʈ�� ����ϼ̽��ϴ�.");
	getSqlMapClientTemplate().insert("savememberpointSql.savePointInfor",songpurchasevo);
	}
	
	else{
	songpurchasevo.setPoint(300);
	songpurchasevo.setNote("���ǵ��, 300����Ʈ ����ϼ̽��ϴ�.");
	getSqlMapClientTemplate().insert("savememberpointSql.savePointInfor",songpurchasevo);
	}

	
	
}

}