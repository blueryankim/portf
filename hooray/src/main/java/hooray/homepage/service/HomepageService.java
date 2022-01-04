package hooray.homepage.service;

import java.util.List;

import hooray.homepage.model.HomepageVO;

public interface HomepageService {
	
	public List<HomepageVO> getHomeHotList();
	public List<HomepageVO> getHomeNewList();

}
