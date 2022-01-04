package subak.myPage.service;

import subak.myPage.dao.MyPageDao;

public class MyPageHomeServiceImpl implements MyPageHomeService {
	/**
	 * @uml.property  name="myPageDao"
	 * @uml.associationEnd  
	 */
	private MyPageDao myPageDao;

	/**
	 * @param myPageDao
	 * @uml.property  name="myPageDao"
	 */
	public void setMyPageDao(MyPageDao myPageDao) {
		this.myPageDao = myPageDao;
	}

	@Override
	public Integer getHavingPoint(Object obj) {
		return this.myPageDao.getHavingPoint(obj);
	}
	
	@Override
	public Integer getDownloadCount(Object obj) {
		return this.myPageDao.getDownloadCount(obj);
	}

	@Override
	public Integer getMyAlbumCount(Object obj) {
		return this.myPageDao.getMyAlbumCount(obj);
	}
	
}