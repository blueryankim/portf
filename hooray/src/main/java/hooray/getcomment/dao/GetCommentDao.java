package hooray.getcomment.dao;

import java.util.Date;
import java.util.List;

import hooray.getcomment.model.GetCommentVO;

public interface GetCommentDao {
	
	public List<GetCommentVO> getAllComment(Object obj);
	public int getCommentCount(int projectNum);
	public void uploadComment(GetCommentVO getCommentVO);
	public Date getLastCommentDate(Object obj);
	public List<GetCommentVO> getCommentList(Object obj);
	public void updateComment(Object obj);
	public void deleteComment(int commentNum);
}
