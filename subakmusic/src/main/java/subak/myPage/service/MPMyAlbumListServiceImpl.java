package subak.myPage.service;

import java.util.List;
import subak.myPage.dao.MyPageDao;
import subak.myPage.model.AlbumVO;

public class MPMyAlbumListServiceImpl implements MPMyAlbumListService {
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
	public Integer getMyAlbumCount(Object obj) {
		return this.myPageDao.getMyAlbumCount(obj);
	}

	@Override
	public List<AlbumVO> getAlbumList(Object obj) {
		return this.myPageDao.getAlbumList(obj);
	}

}