package subak.myPage.service;

import java.util.List;
import subak.myPage.dao.MyPageDao;
import subak.myPage.model.DownloadListVO;

public class MPDownloadListServiceImpl implements MPDownloadListService {
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
	public Integer getDownloadCount(Object obj) {
		return this.myPageDao.getDownloadCount(obj);
	}

	@Override
	public List<DownloadListVO> getDownloadList(Object obj) {
		return this.myPageDao.getDownloadList(obj);
	}

} //end- class