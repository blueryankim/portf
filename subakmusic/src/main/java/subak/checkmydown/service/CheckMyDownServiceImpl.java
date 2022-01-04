package subak.checkmydown.service;

import subak.checkmydown.dao.CheckMyDownDao;
import subak.checkmydown.model.CheckMyDownVO;

public class CheckMyDownServiceImpl implements CheckMyDownService{

	/**
	 * @uml.property  name="checkmydowndao"
	 * @uml.associationEnd  
	 */
	private CheckMyDownDao checkmydowndao;
	@Override
	public CheckMyDownVO songPurchaseCheck(CheckMyDownVO checkmydownvo) {
		
		return checkmydowndao.checkMyDown(checkmydownvo);
	}
	/**
	 * @return
	 * @uml.property  name="checkmydowndao"
	 */
	public CheckMyDownDao getCheckmydowndao() {
		return checkmydowndao;
	}
	/**
	 * @param checkmydowndao
	 * @uml.property  name="checkmydowndao"
	 */
	public void setCheckmydowndao(CheckMyDownDao checkmydowndao) {
		this.checkmydowndao = checkmydowndao;
	}
	
	

	
}
