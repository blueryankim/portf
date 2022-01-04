package subak.qcomment.service;

import subak.qcomment.dao.QCommentDao;

public class QCommentDeleteImpl implements QCommentDeleteService {
	/**
	 * @uml.property  name="commentDao"
	 * @uml.associationEnd  
	 */
	private QCommentDao commentDao;
	/**
	 * @param commentDao
	 * @uml.property  name="commentDao"
	 */
	public void setCommentDao(QCommentDao commentDao) {
		this.commentDao = commentDao;
	}
	@Override
	public void delete(int id) {
		commentDao.delete(id);

	}

}
