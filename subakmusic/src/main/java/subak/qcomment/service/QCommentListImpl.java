package subak.qcomment.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import subak.qcomment.dao.QCommentDao;
import subak.qcomment.model.QCommentVO;


public class QCommentListImpl implements QCommentListService {
	public static final int DEFAULT_PAGE_SIZE = 20;
	/**
	 * @uml.property  name="pageSize"
	 */
	private int pageSize =DEFAULT_PAGE_SIZE;
	/**
	 * @uml.property  name="commentDao"
	 * @uml.associationEnd  
	 */
	private QCommentDao commentDao;
	/**
	 * @return
	 * @uml.property  name="pageSize"
	 */
	public int getPageSize() {
		return pageSize;
	}
	/**
	 * @param pageSize
	 * @uml.property  name="pageSize"
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	/**
	 * @return
	 * @uml.property  name="commentDao"
	 */
	public QCommentDao getCommentDao() {
		return commentDao;
	}
	/**
	 * @param commentDao
	 * @uml.property  name="commentDao"
	 */
	public void setCommentDao(QCommentDao commentDao) {
		this.commentDao = commentDao;
	}
	
	@Transactional
	public List<QCommentVO> getMessageList(int pageNum, int num) {
		int totalCount = commentDao.count();
		return commentDao.select(1, totalCount, num);
	}

}
