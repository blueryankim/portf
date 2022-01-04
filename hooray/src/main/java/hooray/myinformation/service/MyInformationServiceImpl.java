package hooray.myinformation.service;

import java.util.List;

import hooray.myinformation.dao.MyInformationDao;
import hooray.myinformation.model.MyInformationVO;
import hooray.myinformation.model.ProjectVO;

public class MyInformationServiceImpl implements MyInformationService {
	
	private MyInformationDao myInformationDao;

	@Override
	public MyInformationVO getMyInformation(String email) {
		
		return myInformationDao.getMyInformation(email);
	}



	@Override
	public Object getMyProjectCount(String email) {
		return myInformationDao.getMyProjectCount(email);
		 
	}


	@Override
	public List<ProjectVO> getMyProjectList(Object obj) {
		return myInformationDao.getMyProjectList(obj);
	
	}

	@Override
	public List<ProjectVO> getAppProjectList(Object obj) {
		
		return myInformationDao.getAppProjectList(obj);
	}
	
	@Override
	public List<ProjectVO> getEndProjectList(Object obj) {
		
		return myInformationDao.getEndProjectList(obj);
	}

	
	public MyInformationDao getMyInformationDao() {
		return myInformationDao;
	}

	public void setMyInformationDao(MyInformationDao myInformationDao) {
		this.myInformationDao = myInformationDao;
	}



	@Override
	public List<ProjectVO> refreshList(Object obj,String email) {

		return myInformationDao.refreshList(obj,email);
	}



	
}
