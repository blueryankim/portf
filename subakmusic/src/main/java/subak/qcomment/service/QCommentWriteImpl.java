package subak.qcomment.service;

import org.springframework.transaction.annotation.Transactional;

import subak.qcomment.dao.QCommentDao;
import subak.qcomment.model.QCommentVO;


public class QCommentWriteImpl implements QCommentWriteService {
	/**
	 * @uml.property  name="commentDao"
	 * @uml.associationEnd  
	 */
	private QCommentDao commentDao;
	@Override
	public int nexVal() {
		// TODO Auto-generated method stub
		return commentDao.nextVal();
	}

	/**
	 * @param commentDao
	 * @uml.property  name="commentDao"
	 */
	public void setCommentDao(QCommentDao commentDao) {
		this.commentDao = commentDao;
	}

	@Transactional
	public QCommentVO write(QCommentVO message) {
		commentDao.insert(message);
		return message;
	}

}
