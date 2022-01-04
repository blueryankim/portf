package circle.autogetallcomment.dao;

import java.util.Date;
import java.util.List;

import circle.autogetallcomment.model.AutoGetAllCommentVO;
import circle.autogetallcomment.model.GetCommentCountVO;

public interface AutoGetAllCommentDao {

	public List<GetCommentCountVO> getCommentCount(String id);
	public List<AutoGetAllCommentVO> getCommentList(Object obj);
	public void upCommentCount(int gulnum);
	public Date getEndCommentTime(String id);
}
