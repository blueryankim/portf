package finder.bringgridpage.service;

import java.util.List;

import finder.bringgridpage.dao.BringGridPageDao;
import finder.bringgridpage.model.BringGridPageVO;

public class BringGridPageServiceImpl implements BringGridPageService {

	private BringGridPageDao bgpd;
	@Override
	public List<BringGridPageVO> bringGridPage(String flag) {
		
		return bgpd.bringGridPage(flag);
	}
	
	@Override
	public List<BringGridPageVO> bringGridContents(Object obj) {
		
		return bgpd.bringGridContents(obj);
	}
	

	@Override
	public int getMyAlbumCount(String id) {
		
		return bgpd.getMyAlbumCount(id);
	}

	@Override
	public int getMyBookCount(String id) {
		
		return bgpd.getMyBookCount(id);
	}

	@Override
	public int getMyWritingCount(String id) {
		
		return bgpd.getMyWritingCount(id);
	}

	
	public BringGridPageDao getBgpd() {
		return bgpd;
	}
	public void setBgpd(BringGridPageDao bgpd) {
		this.bgpd = bgpd;
	}
	
	
}
