package subak.fcomment.service;

import subak.fcomment.dao.FCommentDao;
import subak.fcomment.model.FCommentVO;

public class FCommentUpdateImpl implements FCommentUpdateService {
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
	public void update(FCommentVO message) {
		commentDao.update(message);

	}

}
