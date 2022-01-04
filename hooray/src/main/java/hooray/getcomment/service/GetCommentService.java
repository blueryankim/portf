package hooray.getcomment.service;

import java.util.Date;
import java.util.List;

import hooray.getcomment.model.GetCommentVO;

public interface GetCommentService {
	
	public List<GetCommentVO> getAllComment(Object obj);
	public int getCommentCount(int projectNum);
	
	/*Ajax*/
	public void uploadComment(GetCommentVO getCommentVO);
	public Date getLastCommentDate(Object obj);
	public List<GetCommentVO> getCommentList(Object obj);
	public void updateComment(Object obj);
	public void deleteComment(int commentNum);

}
