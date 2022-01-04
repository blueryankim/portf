package circle.checkid.service;

import circle.checkid.dao.CheckIdDao;

public class CheckIdServiceImpl implements CheckIdService {

	private CheckIdDao checkiddao;

	@Override
	public int checkId(String id) {

		return checkiddao.checkId(id);
	}

	public void setCheckiddao(CheckIdDao checkiddao) {
		this.checkiddao = checkiddao;
	}

	

}
