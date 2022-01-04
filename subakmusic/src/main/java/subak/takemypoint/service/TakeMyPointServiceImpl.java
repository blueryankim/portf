package subak.takemypoint.service;

import subak.takemypoint.dao.TakeMyPointDao;

public class TakeMyPointServiceImpl implements TakeMyPointService {

	/**
	 * @uml.property  name="takemypointdao"
	 * @uml.associationEnd  
	 */
	private TakeMyPointDao takemypointdao;
	@Override
	public int getMemberPoint(String id) {
		
		return takemypointdao.takeMyPoint(id);
	}
	/**
	 * @return
	 * @uml.property  name="takemypointdao"
	 */
	public TakeMyPointDao getTakemypointdao() {
		return takemypointdao;
	}
	/**
	 * @param takemypointdao
	 * @uml.property  name="takemypointdao"
	 */
	public void setTakemypointdao(TakeMyPointDao takemypointdao) {
		this.takemypointdao = takemypointdao;
	}
	
	
	

	
}
