package subak.nboard.service;

import subak.nboard.dao.BoardDao;
import subak.nboard.model.BoardVO;

public class UpdateArticleServiceImpl implements UpdateArticleService {
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
	public void updateArticle(BoardVO boardVo) {
		this.boardDao.updateArticle(boardVo);
	}

	@Override
	public BoardVO getArticle(Integer num) {
		return this.boardDao.getArticle(num);
	}

	@Override
	public String getPass(Integer num) {
		return this.boardDao.getPass(num);
	}
}