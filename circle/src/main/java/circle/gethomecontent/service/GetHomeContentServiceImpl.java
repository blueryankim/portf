package circle.gethomecontent.service;

import java.util.Date;
import java.util.List;

import circle.gethomecontent.dao.GetHomeContentDao;
import circle.gethomecontent.model.CommentCountVO;
import circle.gethomecontent.model.GetCommentVO;
import circle.gethomecontent.model.LoginerInformationVO;
import circle.gethomecontent.model.TimelineContentVO;

public class GetHomeContentServiceImpl implements GetHomeContentService{

	private GetHomeContentDao ghcd;
	
	@Override
	public String getTimeArr(String id) {
		
		return ghcd.getTimeArr(id);
	}
	
	@Override
	public int getTimelineCount(String id) {
		
		return ghcd.getTimelineCount(id);
	}
	
	@Override
	public List<TimelineContentVO> getPopTimelineList(Object obj) {
		
		return ghcd.getPopTimelineList(obj);
	}
	
	@Override
	public Date getLatestTime(String id) {
		
		return ghcd.getLatestTime(id);
	}
	
	@Override
	public List<TimelineContentVO> getLatTimelineList(Object obj) {

		return ghcd.getLatTimelineList(obj);
	}
	
	@Override
	public Date getPopularTime(String id) {
		return ghcd.getPopularTime(id);
	}

	@Override
	public LoginerInformationVO getLoginerInformation(String id) {
		return ghcd.getLoginerInformation(id);
	}

	@Override
	public List<GetCommentVO> getPopCommentList(Object obj) {
		
		return ghcd.getPopCommentList(obj);
	}

	
	public void setGhcd(GetHomeContentDao ghcd) {
		this.ghcd = ghcd;
	}

	@Override
	public List<GetCommentVO> getLatCommentList(Object obj) {
		
		return ghcd.getLatCommentList(obj);
	}

	@Override
	public List<CommentCountVO> getPopCommentCountList(Object obj) {
		
		return ghcd.getPopCommentCountList(obj);
	}

	@Override
	public List<CommentCountVO> getLatCommentCountList(Object obj) {
		return ghcd.getLatCommentCountList(obj);
	}

	@Override
	public void setCommentCount(Object obj) {
		ghcd.setCommentCount(obj);
		
	}

	@Override
	public Date getLatestCommentTime(String id) {

		return ghcd.getLatestCommentTime(id);
	}

	
	


	

	

	

	



	
	
	

}
