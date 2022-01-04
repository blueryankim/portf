package hooray.login.service;

import hooray.login.dao.EmailAndPassCheckDao;

public class EmailAndPassCheckServiceImpl implements EmailAndPassCheckService {

	
	private EmailAndPassCheckDao emailAndPassCheckDao;
	
	@Override
	public String emailAndPassCheck(Object obj) {
		
		return emailAndPassCheckDao.emailAndPassCheck(obj);
	}
	
	@Override
	public int checkEmail(String email) {
		
		return emailAndPassCheckDao.emailCheck(email);
	}
	
	
	
	public EmailAndPassCheckDao getEmailAndPassCheckDao() {
		return emailAndPassCheckDao;
	}
	public void setEmailAndPassCheckDao(EmailAndPassCheckDao emailAndPassCheckDao) {
		this.emailAndPassCheckDao = emailAndPassCheckDao;
	}



	
	
	

}
