package finder.home.service;

import java.util.List;

import finder.home.dao.HomeDao;
import finder.home.model.HomeVO;

public class HomeServiceImpl implements HomeService {
	
	private HomeDao hd;

	@Override
	public List<HomeVO> getHomeAlbumList() {
		
		return hd.getHomeAlbumList();
	}

	@Override
	public List<HomeVO> getHomeBookList() {
		
		return hd.getHomeBookList();
	}

	@Override
	public List<HomeVO> getHomeWritingList() {
	
		return hd.getHomeWritingList();
	}

	@Override
	public int getMyAlbumCount(String id) {
		
		return hd.getMyAlbumCount(id);
	}

	@Override
	public int getMyBookCount(String id) {
		
		return hd.getMyBookCount(id);
	}

	@Override
	public int getMyWritingCount(String id) {
		
		return hd.getMyWritingCount(id);
	}

	
	@Override
	public String getMyName(String id) {
	
		return hd.getMyName(id);
	}

	
	public HomeDao getHd() {
		return hd;
	}

	public void setHd(HomeDao hd) {
		this.hd = hd;
	}

	
	
}
