package subak.qboard.service;

import subak.qboard.dao.QBoardDao;
import subak.qboard.model.QBoardVO;

public class QUpdateArticleServiceImpl implements QUpdateArticleService {
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
	public void updateArticle(QBoardVO boardVo) {
		this.boardDao.updateArticle(boardVo);
	}

	@Override
	public QBoardVO getArticle(Integer num) {
		return this.boardDao.getArticle(num);
	}

	@Override
	public String getPass(Integer num) {
		return this.boardDao.getPass(num);
	}
}