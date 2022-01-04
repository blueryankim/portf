package subak.myPage.service;

import subak.myPage.dao.MyPageDao;

public class MPDeleteMemberServiceImpl implements MPDeleteMemberService {
	/**
	 * @uml.property  name="myPageDao"
	 * @uml.associationEnd  
	 */
	private MyPageDao myPageDao;
	
	/**
	 * @param myPageDao
	 * @uml.property  name="myPageDao"
	 */
	public void setMyPageDao(MyPageDao myPageDao) {
		this.myPageDao = myPageDao;
	}

	@Override
	public String getPass(String userID) {
		return this.myPageDao.getPass(userID);
	}

	@Override
	public void deleteMember(String userID) {
		this.myPageDao.deleteMember(userID);
	}

}