package hooray.uploadproject.service;

import hooray.uploadproject.dao.SaveImageDao;

public class SaveImageServiceImpl implements SaveImageService {

	private SaveImageDao saveImageDao;
	@Override
	public int getProjectNum() {
		
		return saveImageDao.getProjectNum();
	}
	public SaveImageDao getSaveImageDao() {
		return saveImageDao;
	}
	public void setSaveImageDao(SaveImageDao saveImageDao) {
		this.saveImageDao = saveImageDao;
	}

	
}
