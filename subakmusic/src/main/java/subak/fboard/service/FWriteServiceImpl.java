package subak.fboard.service;

import subak.fboard.dao.FBoardDao;
import subak.fboard.model.FBoardVO;

public class FWriteServiceImpl implements FWriteService {
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
	public void insertWriting(FBoardVO boardVo) {
		this.boardDao.insertArticle(boardVo);
	}
}