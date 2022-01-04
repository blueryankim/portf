package subak.nboard.service;

import subak.nboard.dao.BoardDao;

public class DeleteArticleServiceImpl implements DeleteArticleService {
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
	public String getPass(Integer num) {
		return this.boardDao.getPass(num);
	}

	@Override
	public void deleteArticle(Integer num) {
		this.boardDao.deleteArticle(num);
	}
}