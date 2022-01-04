package subak.fboard.service;

import subak.fboard.dao.FBoardDao;
import subak.fboard.model.FBoardVO;

public class FGetArticleServiceImpl implements FGetArticleService {
	/**
	 * @uml.property  name="boardDao"
	 * @uml.associationEnd  
	 */
	private FBoardDao boardDao;

	/**
	 * @return
	 * @uml.property  name="boardDao"
	 */
	public FBoardDao getBoardDao() {
		return boardDao;
	}

	/**
	 * @param boardDao
	 * @uml.property  name="boardDao"
	 */
	public void setBoardDao(FBoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public FBoardVO getArticle(Integer num) {
		return this.boardDao.getArticle(num);
	}

	@Override
	public String getArticle_type(Integer num) {
		return this.getArticle_type(num);
	}
}