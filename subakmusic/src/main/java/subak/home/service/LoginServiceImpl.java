package subak.home.service;

import subak.home.dao.LoginDAO;
import subak.home.model.MemberVO;

public class LoginServiceImpl implements LoginService {

	/**
	 * @uml.property  name="loginDAO"
	 * @uml.associationEnd  
	 */
	private LoginDAO loginDAO;
	
	
	/**
	 * @param loginDAO
	 * @uml.property  name="loginDAO"
	 */
	public void setLoginDAO(LoginDAO loginDAO) {
		this.loginDAO = loginDAO;
	}

	@Override
	public String getPass(String id) {
		return loginDAO.getPass(id);
	}

	@Override
	public MemberVO getMemberInfo(String id) {
		return this.loginDAO.getMemberInfo(id);
	}

}
