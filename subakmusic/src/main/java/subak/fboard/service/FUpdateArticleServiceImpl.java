package subak.fboard.service;

import subak.fboard.dao.FBoardDao;
import subak.fboard.model.FBoardVO;

public class FUpdateArticleServiceImpl implements FUpdateArticleService {
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
	public void updateArticle(FBoardVO boardVo) {
		this.boardDao.updateArticle(boardVo);
	}

	@Override
	public FBoardVO getArticle(Integer num) {
		return this.boardDao.getArticle(num);
	}

	@Override
	public String getPass(Integer num) {
		return this.boardDao.getPass(num);
	}
}