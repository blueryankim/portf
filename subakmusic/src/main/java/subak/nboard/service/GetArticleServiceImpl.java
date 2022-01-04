package subak.nboard.service;

import subak.nboard.dao.BoardDao;
import subak.nboard.model.BoardVO;

public class GetArticleServiceImpl implements GetArticleService {
	/**
	 * @uml.property  name="boardDao"
	 * @uml.associationEnd  
	 */
	private BoardDao boardDao;

	/**
	 * @return
	 * @uml.property  name="boardDao"
	 */
	public BoardDao getBoardDao() {
		return boardDao;
	}

	/**
	 * @param boardDao
	 * @uml.property  name="boardDao"
	 */
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public BoardVO getArticle(Integer num) {
		return this.boardDao.getArticle(num);
	}

	@Override
	public String getArticle_type(Integer num) {
		return this.getArticle_type(num);
	}
}