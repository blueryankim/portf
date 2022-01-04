package subak.qboard.service;

import subak.qboard.dao.QBoardDao;
import subak.qboard.model.QBoardVO;

public class QGetArticleServiceImpl implements QGetArticleService {
	/**
	 * @uml.property  name="boardDao"
	 * @uml.associationEnd  
	 */
	private QBoardDao boardDao;

	/**
	 * @return
	 * @uml.property  name="boardDao"
	 */
	public QBoardDao getBoardDao() {
		return boardDao;
	}

	/**
	 * @param boardDao
	 * @uml.property  name="boardDao"
	 */
	public void setBoardDao(QBoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public QBoardVO getArticle(Integer num) {
		return this.boardDao.getArticle(num);
	}

	@Override
	public String getArticle_type(Integer num) {
		return this.getArticle_type(num);
	}
}