package finder.member.service;

import finder.member.model.IdConfirmAndLoginVO;

public interface IdConfirmAndLoginService {

	public int idExistConfirm(String loinId);
	public int inputConfirm(IdConfirmAndLoginVO icVO);
	public String getTimelineArr(String id);
}
