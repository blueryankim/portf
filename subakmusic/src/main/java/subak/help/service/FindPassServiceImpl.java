package subak.help.service;

import subak.help.dao.HelpDAO;

public class FindPassServiceImpl implements FindPassService {

	/**
	 * @uml.property  name="helpDAO"
	 * @uml.associationEnd  
	 */
	private HelpDAO helpDAO;
	
	/**
	 * @param helpDAO
	 * @uml.property  name="helpDAO"
	 */
	public void setHelpDAO(HelpDAO helpDAO) {
		this.helpDAO = helpDAO;
	}

	@Override
	public String getEmail(String name) {
		return helpDAO.getEmail(name);
	}

	@Override
	public String getId(String email) {
		return helpDAO.getId(email);
	}

	@Override
	public String getPass(String id) {
		return helpDAO.getPass(id);
	}
}
