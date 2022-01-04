package hooray.homepage.dao;

import java.util.List;

import hooray.homepage.model.HomepageVO;

public interface HomepageDao {
	
	public List<HomepageVO> getHomeHotList();
	public List<HomepageVO> getHomeNewList();

}
