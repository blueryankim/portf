package hooray.getproject.service;

import hooray.getproject.dao.GetAProjectDao;
import hooray.getproject.model.GetProjectVO;

public class GetAProjectServiceImpl implements GetAProjectService{

	private GetAProjectDao getAProjectDao;
	@Override
	public GetProjectVO getAProject(int projectNum) {
		
		return getAProjectDao.getAProject(projectNum);
	}
	public GetAProjectDao getGetAProjectDao() {
		return getAProjectDao;
	}
	public void setGetAProjectDao(GetAProjectDao getAProjectDao) {
		this.getAProjectDao = getAProjectDao;
	}
	
	

}
