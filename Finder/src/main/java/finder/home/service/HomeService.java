package finder.home.service;

import java.util.List;

import finder.home.model.HomeVO;

public interface HomeService {

	public List<HomeVO> getHomeAlbumList();
	public List<HomeVO> getHomeBookList();
	public List<HomeVO> getHomeWritingList();
	public int getMyAlbumCount(String id);
	public int getMyBookCount(String id);
	public int getMyWritingCount(String id);
	public String getMyName(String id);
	
}
