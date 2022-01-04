package hooray.homepage.service;

import java.util.List;

import hooray.homepage.dao.HomepageDao;
import hooray.homepage.model.HomepageVO;

public class HomepageServiceImpl implements HomepageService {
	private HomepageDao homepageDao;
	@Override
	public List<HomepageVO> getHomeHotList() {
		
		return homepageDao.getHomeHotList();
	}

	@Override
	public List<HomepageVO> getHomeNewList() {
		// TODO Auto-generated method stub
		return homepageDao.getHomeNewList();
	}

	public HomepageDao getHomepageDao() {
		return homepageDao;
	}

	public void setHomepageDao(HomepageDao homePageDao) {
		this.homepageDao = homePageDao;
	}
	
	

}
