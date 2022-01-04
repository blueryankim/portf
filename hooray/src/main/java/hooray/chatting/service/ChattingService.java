package hooray.chatting.service;

import java.util.Date;
import java.util.List;

import hooray.chatting.model.ChattingVO;

public interface ChattingService {

	public Date getAppDate(Object obj);
	public List<ChattingVO> getChattingList(Object obj);
	public int getUnreadCount(Object obj);
	public String getProjectOwner(int projectNum);
	public void uploadChattingMessage(ChattingVO chattingVO);
	public List<ChattingVO> bringOldMessage(Object obj);
	public void updateLogDate(Object obj);
	public int getChattingPeopleCount(int projectNum);
}
