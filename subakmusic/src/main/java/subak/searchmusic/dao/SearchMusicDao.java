package subak.searchmusic.dao;

import java.util.List;

import subak.searchmusic.model.SearchMusicVO;

public interface SearchMusicDao {

	public List<SearchMusicVO> searchMusicList(Object obj);
	public int searchMusicCount(Object obj);
}
