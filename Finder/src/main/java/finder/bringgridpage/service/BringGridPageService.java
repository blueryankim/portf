package finder.bringgridpage.service;

import java.util.List;

import finder.bringgridpage.model.BringGridPageVO;

public interface BringGridPageService {

	public List<BringGridPageVO> bringGridPage(String flag);
	public int getMyAlbumCount(String id);
	public int getMyBookCount(String id);
	public int getMyWritingCount(String id);
	public List<BringGridPageVO> bringGridContents(Object obj);
}
