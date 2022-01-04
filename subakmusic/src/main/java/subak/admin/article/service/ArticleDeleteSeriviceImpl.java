package subak.admin.article.service;

import subak.fboard.dao.FBoardDao;

public class ArticleDeleteSeriviceImpl implements ArticleDeleteService {
	
	/**
	 * @uml.property  name="fBoardDao"
	 * @uml.associationEnd  
	 */
	private FBoardDao fBoardDao;
	
	/**
	 * @param fBoardDao
	 * @uml.property  name="fBoardDao"
	 */
	public void setfBoardDao(FBoardDao fBoardDao) {
		this.fBoardDao = fBoardDao;
	}
	@Override
	public void deleteArticle(Integer num) {

		fBoardDao.deleteArticle(num);
	}

}
