package subak.qboard.service;

import subak.qboard.dao.QBoardDao;
import subak.qboard.model.QBoardVO;

public class QWriteServiceImpl implements QWriteService {
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
	public void insertWriting(QBoardVO boardVo) {
		this.boardDao.insertArticle(boardVo);
	}
}