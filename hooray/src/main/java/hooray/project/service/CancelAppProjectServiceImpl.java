package hooray.project.service;

import hooray.project.dao.CancelAppProjectDao;

public class CancelAppProjectServiceImpl implements CancelAppProjectService{

	private CancelAppProjectDao cancelAppProjectDao;
	@Override
	public void cancelAppProject(Object obj) {
		cancelAppProjectDao.cancelAppProject(obj);
		
	}
	public CancelAppProjectDao getCancelAppProjectDao() {
		return cancelAppProjectDao;
	}
	public void setCancelAppProjectDao(CancelAppProjectDao cancelAppProjectDao) {
		this.cancelAppProjectDao = cancelAppProjectDao;
	}

	

}
