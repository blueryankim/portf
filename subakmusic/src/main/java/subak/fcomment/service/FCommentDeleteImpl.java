package subak.fcomment.service;

import subak.fcomment.dao.FCommentDao;

public class FCommentDeleteImpl implements FCommentDeleteService {
	/**
	 * @uml.property  name="commentDao"
	 * @uml.associationEnd  
	 */
	private FCommentDao commentDao;
	/**
	 * @param commentDao
	 * @uml.property  name="commentDao"
	 */
	public void setCommentDao(FCommentDao commentDao) {
		this.commentDao = commentDao;
	}
	@Override
	public void delete(int id) {
		commentDao.delete(id);

	}

}
