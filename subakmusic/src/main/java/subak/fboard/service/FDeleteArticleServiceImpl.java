package subak.fboard.service;

import subak.fboard.dao.FBoardDao;

public class FDeleteArticleServiceImpl implements FDeleteArticleService {
	/**
	 * @uml.property  name="boardDao"
	 * @uml.associationEnd  
	 */
	private FBoardDao boardDao;

	/**
	 * @param boardDao
	 * @uml.property  name="boardDao"
	 */
	public void setBoardDao(FBoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public String getPass(Integer num) {
		return this.boardDao.getPass(num);
	}

	@Override
	public void deleteArticle(Integer num) {
		this.boardDao.deleteArticle(num);
	}
}