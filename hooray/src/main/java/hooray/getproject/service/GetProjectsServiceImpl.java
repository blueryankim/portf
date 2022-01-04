package hooray.getproject.service;

import java.util.Date;
import java.util.List;

import hooray.getproject.dao.GetProjectsDao;
import hooray.getproject.model.GetProjectVO;

public class GetProjectsServiceImpl implements GetProjectsService{
	
	private GetProjectsDao getProjectsDao;
	
	public List<GetProjectVO> getProjects(Object obj){
			return getProjectsDao.getProjects(obj);
	}

	@Override
	public Date getLatestDate() {
			return getProjectsDao.getLatestDate();
	}

	
	public GetProjectsDao getGetProjectsDao() {
		return getProjectsDao;
	}

	public void setGetProjectsDao(GetProjectsDao getProjectsDao) {
		this.getProjectsDao = getProjectsDao;
	}

	@Override
	public List<GetProjectVO> getKindProjects(Object obj) {

		return getProjectsDao.getKindProjects(obj);
	}

	@Override
	public List<GetProjectVO> getSelectProjects(Object obj) {
	
		return getProjectsDao.getSelectProjects(obj);
	}

	
	
}
