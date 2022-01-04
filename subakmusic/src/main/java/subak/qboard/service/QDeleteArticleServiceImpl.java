package subak.qboard.service;

import subak.qboard.dao.QBoardDao;

public class QDeleteArticleServiceImpl implements QDeleteArticleService {
	/**
	 * @uml.property  name="boardDao"
	 * @uml.associationEnd  
	 */
	private QBoardDao boardDao;

	/**
	 * @param boardDao
	 * @uml.property  name="boardDao"
	 */
	public void setBoardDao(QBoardDao boardDao) {
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