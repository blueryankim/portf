package circle.gethomecontent.service;

import java.util.Date;
import java.util.List;

import circle.gethomecontent.model.CommentCountVO;
import circle.gethomecontent.model.GetCommentVO;
import circle.gethomecontent.model.LoginerInformationVO;
import circle.gethomecontent.model.TimelineContentVO;

public interface GetHomeContentService {
	
	public String getTimeArr(String id);
	public int getTimelineCount(String id);
	public Date getPopularTime(String id);
	public List<TimelineContentVO> getPopTimelineList(Object obj);
	public Date getLatestTime(String id);
	public List<TimelineContentVO> getLatTimelineList(Object obj);
	public LoginerInformationVO getLoginerInformation(String id);
	public List<GetCommentVO> getPopCommentList(Object obj);
	public List<GetCommentVO> getLatCommentList(Object obj);
	public List<CommentCountVO> getPopCommentCountList(Object obj);
	public List<CommentCountVO> getLatCommentCountList(Object obj);
	public void setCommentCount(Object obj);
	public Date getLatestCommentTime(String id);

}
