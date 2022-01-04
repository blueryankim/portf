package subak.nboard.service;

import subak.nboard.dao.BoardDao;
import subak.nboard.model.BoardVO;

public class WriteServiceImpl implements WriteService {
	/**
	 * @uml.property  name="boardDao"
	 * @uml.associationEnd  
	 */
	private BoardDao boardDao;

	/**
	 * @param boardDao
	 * @uml.property  name="boardDao"
	 */
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public void insertWriting(BoardVO boardVo) {
		this.boardDao.insertArticle(boardVo);
	}
}