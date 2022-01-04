package finder.member.dao;

import finder.member.model.IdConfirmAndLoginVO;

public interface IdConfirmAndLoginDao {

	public int idExistConfirm(String loginId);
	public int inputConfirm(IdConfirmAndLoginVO icalVO);
	public String getTimelineArr(String id);
}
