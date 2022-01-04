package circle.member.service;

import circle.member.model.IdConfirmAndLoginVO;

public interface IdConfirmAndLoginService {

	public int idExistConfirm(String loinId);
	public int inputConfirm(IdConfirmAndLoginVO icVO);
	public String getTimelineArr(String id);
}
