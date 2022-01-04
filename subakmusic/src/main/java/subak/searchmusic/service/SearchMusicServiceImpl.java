package subak.searchmusic.service;

import java.util.List;


import subak.searchmusic.dao.SearchMusicDao;
import subak.searchmusic.model.SearchMusicVO;

public class SearchMusicServiceImpl implements SearchMusicService{

	/**
	 * @uml.property  name="searchmusicdao"
	 * @uml.associationEnd  
	 */
	private SearchMusicDao searchmusicdao;
	@Override
	public List<SearchMusicVO> searchMusicList(Object obj) {
		
		return searchmusicdao.searchMusicList(obj);
	}
	
	@Override
	public int searchMusicCount(Object obj) {
	
		return searchmusicdao.searchMusicCount(obj);
	}
	
	/**
	 * @return
	 * @uml.property  name="searchmusicdao"
	 */
	public SearchMusicDao getSearchmusicdao() {
		return searchmusicdao;
	}
	/**
	 * @param searchmusicdao
	 * @uml.property  name="searchmusicdao"
	 */
	public void setSearchmusicdao(SearchMusicDao searchmusicdao) {
		this.searchmusicdao = searchmusicdao;
	}



	

	
	
}
