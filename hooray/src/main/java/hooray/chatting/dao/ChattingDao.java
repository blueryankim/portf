package hooray.chatting.dao;

import java.util.Date;
import java.util.List;

import hooray.chatting.model.ChattingVO;

public interface ChattingDao {
	
	public Date getAppDate(Object obj);
	public List<ChattingVO> getChattingList(Object obj);
	public int getUnreadCount(Object obj);
	public String getProjectOwner(int projectNum);
	public void uploadChattingMessage(ChattingVO chattingVO);
	public List<ChattingVO> bringOldMessage(Object obj);
	public void updateLogDate(Object obj);
	public int getChattingPeopleCount(int projectNum);
}
