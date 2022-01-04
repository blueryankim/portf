package hooray.getcomment.service;

import java.util.Date;
import java.util.List;

import hooray.getcomment.dao.GetCommentDao;
import hooray.getcomment.model.GetCommentVO;

public class GetCommentServiceImpl implements GetCommentService {

	private GetCommentDao getCommentDao;
	@Override
	public List<GetCommentVO> getAllComment(Object obj) {

		return getCommentDao.getAllComment(obj);
	}
	
	@Override
	public int getCommentCount(int projectNum) {
	
		return getCommentDao.getCommentCount(projectNum);
	}

	/*Ajax*/
	@Override
	public void uploadComment(GetCommentVO getCommentVO) {
		getCommentDao.uploadComment(getCommentVO);
		
	}

	@Override
	public Date getLastCommentDate(Object obj) {
		
		return getCommentDao.getLastCommentDate(obj);
	}

	@Override
	public List<GetCommentVO> getCommentList(Object obj) {
		
		return getCommentDao.getCommentList(obj);
	}
	
	@Override
	public void updateComment(Object obj) {
		getCommentDao.updateComment(obj);
		
	}
	

	@Override
	public void deleteComment(int commentNum) {
		getCommentDao.deleteComment(commentNum);
		
	}



	
	
	public GetCommentDao getGetCommentDao() {
		return getCommentDao;
	}
	public void setGetCommentDao(GetCommentDao getCommentDao) {
		this.getCommentDao = getCommentDao;
	}

	
	
}
