package subak.songpurchase.service;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import subak.songpurchase.dao.GetMemberPointDao;
import subak.songpurchase.dao.SavePointInforDao;
import subak.songpurchase.dao.SavePurchaseInforDao;
import subak.songpurchase.dao.UpdateClickCountDao;
import subak.songpurchase.dao.UpdateMemberPointDao;
import subak.songpurchase.model.SongPurchaseVO;

public class SongPurchaseServiceImpl implements SongPurchaseService {

	/**
	 * @uml.property  name="getmemberpoint"
	 * @uml.associationEnd  
	 */
	private GetMemberPointDao getmemberpoint;
	/**
	 * @uml.property  name="savepointinfor"
	 * @uml.associationEnd  
	 */
	private SavePointInforDao savepointinfor;
	/**
	 * @uml.property  name="savepurchaseinfor"
	 * @uml.associationEnd  
	 */
	private SavePurchaseInforDao savepurchaseinfor;
	/**
	 * @uml.property  name="updatememberpoint"
	 * @uml.associationEnd  
	 */
	private UpdateMemberPointDao updatememberpoint;
	/**
	 * @uml.property  name="updateclickcount"
	 * @uml.associationEnd  
	 */
	private UpdateClickCountDao updateclickcount;
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public int SongPurchase(SongPurchaseVO songpurchasevo) {
		
		savepointinfor.savaPointInfor(songpurchasevo);
		savepurchaseinfor.savePurchaseInfor(songpurchasevo);
		updatememberpoint.updateMemberPoint(songpurchasevo);
		updateclickcount.updateClickCount(songpurchasevo);
		return getmemberpoint.getMemberPoint(songpurchasevo);
		
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public int SongPurchase2(SongPurchaseVO songpurchasevo) {
		
		savepointinfor.savaPointInfor(songpurchasevo);
		updatememberpoint.updateMemberPoint(songpurchasevo);
		updateclickcount.updateClickCount(songpurchasevo);
		return getmemberpoint.getMemberPoint(songpurchasevo);
	}

	
	
	
	/**
	 * @param getmemberpoint
	 * @uml.property  name="getmemberpoint"
	 */
	public void setGetmemberpoint(GetMemberPointDao getmemberpoint) {
		this.getmemberpoint = getmemberpoint;
	}

	
	/**
	 * @param savepointinfor
	 * @uml.property  name="savepointinfor"
	 */
	public void setSavepointinfor(SavePointInforDao savepointinfor) {
		this.savepointinfor = savepointinfor;
	}

	/**
	 * @param savepurchaseinfor
	 * @uml.property  name="savepurchaseinfor"
	 */
	public void setSavepurchaseinfor(SavePurchaseInforDao savepurchaseinfor) {
		this.savepurchaseinfor = savepurchaseinfor;
	}

	/**
	 * @param updatememberpoint
	 * @uml.property  name="updatememberpoint"
	 */
	public void setUpdatememberpoint(UpdateMemberPointDao updatememberpoint) {
		this.updatememberpoint = updatememberpoint;
	}

	/**
	 * @param updateclickcount
	 * @uml.property  name="updateclickcount"
	 */
	public void setUpdateclickcount(UpdateClickCountDao updateclickcount) {
		this.updateclickcount = updateclickcount;
	}


	
	
	
}
