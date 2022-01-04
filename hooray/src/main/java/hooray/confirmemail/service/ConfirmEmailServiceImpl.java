package hooray.confirmemail.service;

import hooray.confirmemail.dao.ConfirmEmailDao;

public class ConfirmEmailServiceImpl implements ConfirmEmailService {

	private ConfirmEmailDao checkiddao;

	@Override
	public int checkId(String id) {

		return checkiddao.checkId(id);
	}

	public void setCheckiddao(ConfirmEmailDao checkiddao) {
		this.checkiddao = checkiddao;
	}

	

}
