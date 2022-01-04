package subak.uploadsong.service;

import subak.uploadsong.dao.UploadSongDao;
import subak.uploadsong.model.UploadSongVO;

public class InsertSongServiceImpl implements InsertSongService{

	
	/**
	 * @uml.property  name="uploadsongDao"
	 * @uml.associationEnd  
	 */
	private UploadSongDao uploadsongDao;
	public void insertSong(UploadSongVO uploadsongvo){
		
		uploadsongDao.registerSong(uploadsongvo);
	}
	
	/**
	 * @return
	 * @uml.property  name="uploadsongDao"
	 */
	public UploadSongDao getUploadsongDao() {
		return uploadsongDao;
	}
	/**
	 * @param uploadsongDao
	 * @uml.property  name="uploadsongDao"
	 */
	public void setUploadsongDao(UploadSongDao uploadsongDao) {
		this.uploadsongDao = uploadsongDao;
	}
	

	
	
}
