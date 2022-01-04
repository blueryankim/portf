package hooray.chatting.service;

import java.util.Date;
import java.util.List;

import hooray.chatting.dao.ChattingDao;
import hooray.chatting.model.ChattingVO;


public class ChattingServiceImpl implements ChattingService {

	private ChattingDao chattingDao;
	@Override
	public Date getAppDate(Object obj) {
		// TODO Auto-generated method stub
		return chattingDao.getAppDate(obj);
	}
	
	@Override
	public List<ChattingVO> getChattingList(Object obj) {

		return chattingDao.getChattingList(obj);
	}

	
	public ChattingDao getChattingDao() {
		return chattingDao;
	}
	public void setChattingDao(ChattingDao chattingDao) {
		this.chattingDao = chattingDao;
	}

	@Override
	public int getUnreadCount(Object obj) {
		// TODO Auto-generated method stub
		return chattingDao.getUnreadCount(obj);
	}

	@Override
	public String getProjectOwner(int projectNum) {
		
		return chattingDao.getProjectOwner(projectNum);
	}

	@Override
	public void uploadChattingMessage(ChattingVO chattingVO) {
		// TODO Auto-generated method stub
		chattingDao.uploadChattingMessage(chattingVO);
	}

	@Override
	public List<ChattingVO> bringOldMessage(Object obj) {

		return chattingDao.bringOldMessage(obj);
	}

	@Override
	public void updateLogDate(Object obj) {
		chattingDao.updateLogDate(obj);
		
	}

	@Override
	public int getChattingPeopleCount(int projectNum) {
		
		return chattingDao.getChattingPeopleCount(projectNum);
	}
	
	

}
