package subak.myPage.service;

import java.util.List;
import subak.myPage.dao.MyPageDao;
import subak.myPage.model.PointVO;

public class MPPointListServiceImpl implements MPPointListService {
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
	public Integer getPointListCount(Object obj) {
		return this.myPageDao.getPointListCount(obj);
	}

	@Override
	public List<PointVO> getPointList(Object obj) {
		return this.myPageDao.getPointList(obj);
	}

}