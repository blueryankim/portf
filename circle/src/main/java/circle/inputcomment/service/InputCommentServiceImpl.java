package circle.inputcomment.service;

import circle.inputcomment.dao.InputCommentDao;

public class InputCommentServiceImpl implements InputCommentService{

	private InputCommentDao icd;
	@Override
	public void insertComment(Object obj) {
		icd.insertComment(obj);
		
	}
	public void setIcd(InputCommentDao icd) {
		this.icd = icd;
	}
	@Override
	public void updateTimelinetDate(int gulnum) {
		icd.updateTimelineDate(gulnum);
		
	}
	
	
	
	

}
