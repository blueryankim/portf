package subak.fcomment.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import subak.fcomment.dao.FCommentDao;
import subak.fcomment.model.FCommentVO;


public class FCommentListImpl implements FCommentListService {
	public static final int DEFAULT_PAGE_SIZE = 20;
	/**
	 * @uml.property  name="pageSize"
	 */
	private int pageSize =DEFAULT_PAGE_SIZE;
	/**
	 * @uml.property  name="commentDao"
	 * @uml.associationEnd  
	 */
	private FCommentDao commentDao;
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
	public FCommentDao getCommentDao() {
		return commentDao;
	}
	/**
	 * @param commentDao
	 * @uml.property  name="commentDao"
	 */
	public void setCommentDao(FCommentDao commentDao) {
		this.commentDao = commentDao;
	}
	
	@Transactional
	public List<FCommentVO> getMessageList(int pageNum, int num) {
		int totalCount = commentDao.count();
		return commentDao.select(1, totalCount, num);
	}

}
