package subak.myPage.service;

import java.util.List;
import subak.myPage.model.AlbumVO;

public interface MPMyAlbumListService {
	Integer getMyAlbumCount(Object obj);
	List<AlbumVO> getAlbumList(Object obj);
}