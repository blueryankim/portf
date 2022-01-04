package finder.member.service;

import finder.member.dao.IdConfirmAndLoginDao;
import finder.member.model.IdConfirmAndLoginVO;

public class IdConfirmAndLoginServiceImpl implements IdConfirmAndLoginService {

	private IdConfirmAndLoginDao icalDao;
	
	@Override
	public int idExistConfirm(String loginId) {
		
		return icalDao.idExistConfirm(loginId);
	}

	@Override
	public int inputConfirm(IdConfirmAndLoginVO icVO) {
		
		return icalDao.inputConfirm(icVO);
	}

	public void setIcalDao(IdConfirmAndLoginDao icalDao) {
		this.icalDao = icalDao;
	}

	@Override
	public String getTimelineArr(String id) {
		
		return icalDao.getTimelineArr(id);
	}
	
	
	
	

}
