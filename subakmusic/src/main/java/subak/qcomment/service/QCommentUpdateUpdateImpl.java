package subak.qcomment.service;

import subak.qcomment.dao.QCommentDao;
import subak.qcomment.model.QCommentVO;

public class QCommentUpdateUpdateImpl implements QCommentUpdateService {
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
	public void update(QCommentVO message) {
		commentDao.update(message);

	}

}
