package subak.searchmusic.service;

import java.util.List;

import subak.searchmusic.model.SearchMusicVO;

public interface SearchMusicService {

	public List<SearchMusicVO> searchMusicList(Object obj);
	public int searchMusicCount(Object obj);
}
