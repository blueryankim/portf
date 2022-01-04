package circle.autogetallcomment.service;

import java.util.Date;
import java.util.List;

import circle.autogetallcomment.dao.AutoGetAllCommentDao;
import circle.autogetallcomment.model.AutoGetAllCommentVO;
import circle.autogetallcomment.model.GetCommentCountVO;

public class AutoGetAllCommentServiceImpl implements AutoGetAllCommentService{

	private AutoGetAllCommentDao agacd;
	
	@Override
	public List<GetCommentCountVO> getCommentCount(String id) {
		
		return agacd.getCommentCount(id);
	}

	public void setAgacd(AutoGetAllCommentDao agacd) {
		this.agacd = agacd;
	}

	@Override
	public List<AutoGetAllCommentVO> getCommentList(Object obj) {
		return agacd.getCommentList(obj);
	}

	@Override
	public void upCommentCount(int gulnum) {
		agacd.upCommentCount(gulnum);
		
	}

	@Override
	public Date getEndCommentTime(String id) {
		// TODO Auto-generated method stub
		return agacd.getEndCommentTime(id);
	}
	
	
	
	
	

}
