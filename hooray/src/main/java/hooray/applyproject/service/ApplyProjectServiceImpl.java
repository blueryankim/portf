package hooray.applyproject.service;

import hooray.applyproject.dao.ApplyProjectDao;

public class ApplyProjectServiceImpl implements ApplyProjectService {

	private ApplyProjectDao applyProjectDao;
	@Override
	public int applyProject(Object obj) {

		return applyProjectDao.applyProject(obj);
	}
	public ApplyProjectDao getApplyProjectDao() {
		return applyProjectDao;
	}
	public void setApplyProjectDao(ApplyProjectDao applyProjectDao) {
		this.applyProjectDao = applyProjectDao;
	}
	@Override
	public int applyProjectBefore(Object obj) {

		return applyProjectDao.applyProjectBefore(obj);
	}

	
	
}
