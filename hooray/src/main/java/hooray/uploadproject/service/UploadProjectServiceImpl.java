package hooray.uploadproject.service;

import hooray.uploadproject.dao.UploadProjectDao;
import hooray.uploadproject.model.UploadProjectVO;

public class UploadProjectServiceImpl implements UploadProjectService{

	private UploadProjectDao uploadProjectDao;
	@Override
	public int insertProject(UploadProjectVO uploadProjectVO) {
		uploadProjectDao.insertProject(uploadProjectVO);
		return uploadProjectDao.confirmProjcet(uploadProjectVO.getProjectNum());
	}
	
	@Override
	public int updateProject(UploadProjectVO uploadProjectVO) {
		uploadProjectDao.updateProject(uploadProjectVO);
		return uploadProjectDao.confirmProjcet(uploadProjectVO.getProjectNum());
	}

	
	public UploadProjectDao getUploadProjectDao() {
		return uploadProjectDao;
	}
	public void setUploadProjectDao(UploadProjectDao uploadProjectDao) {
		this.uploadProjectDao = uploadProjectDao;
	}

	
	
}
