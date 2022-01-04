package subak.admin.article.service;

import java.util.List;

import subak.fboard.dao.FBoardDao;
import subak.fboard.model.FBoardVO;

public class ArticleListServiceImpl implements ArticleListService {

	/**
	 * @uml.property  name="fBoardDao"
	 * @uml.associationEnd  
	 */
	public FBoardDao fBoardDao;
	
	/**
	 * @param fBoardDao
	 * @uml.property  name="fBoardDao"
	 */
	public void setfBoardDao(FBoardDao fBoardDao) {
		this.fBoardDao = fBoardDao;
	}

	@Override
	public List<FBoardVO> getArticleList(Object obj) {
		return fBoardDao.getListForAdmin(obj);
	}

	@Override
	public Integer getArticleCount(Object obj) {
		return fBoardDao.getListCountForAdmin(obj);
	}

}
