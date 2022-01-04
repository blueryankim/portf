package hooray.getapplicant.service;

import java.util.List;

import hooray.getapplicant.dao.GetApplicantDao;
import hooray.getapplicant.model.GetApplicantVO;

public class GetApplicantServiceImpl implements GetApplicantService {

	private GetApplicantDao getApplicantDao;
	@Override
	public List<GetApplicantVO> getApplicantList(int projectNum) {
		// TODO Auto-generated method stub
		return getApplicantDao.getApplicantList(projectNum);
	}
	
	@Override
	public int getApplicantCount(int projectNum) {
		// TODO Auto-generated method stub
		return getApplicantDao.getApplicantCount(projectNum);
	}

	@Override
	public int getMemberProjectCount(String email) {
		// TODO Auto-generated method stub
		return getApplicantDao.getMemberProjectCount(email);
	}
	
	
	public GetApplicantDao getGetApplicantDao() {
		return getApplicantDao;
	}
	public void setGetApplicantDao(GetApplicantDao getApplicantDao) {
		this.getApplicantDao = getApplicantDao;
	}

	
	
}
