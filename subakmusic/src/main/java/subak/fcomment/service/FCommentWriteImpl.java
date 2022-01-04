package subak.fcomment.service;

import org.springframework.transaction.annotation.Transactional;

import subak.fcomment.dao.FCommentDao;
import subak.fcomment.model.FCommentVO;


public class FCommentWriteImpl implements FCommentWriteService {
	/**
	 * @uml.property  name="commentDao"
	 * @uml.associationEnd  
	 */
	private FCommentDao commentDao;
	@Override
	public int nexVal() {
		// TODO Auto-generated method stub
		return commentDao.nextVal();
	}

	/**
	 * @param commentDao
	 * @uml.property  name="commentDao"
	 */
	public void setCommentDao(FCommentDao commentDao) {
		this.commentDao = commentDao;
	}

	@Transactional
	public FCommentVO write(FCommentVO message) {
		commentDao.insert(message);
		return message;
	}

}
