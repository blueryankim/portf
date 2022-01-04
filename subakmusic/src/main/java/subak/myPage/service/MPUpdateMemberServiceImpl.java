package subak.myPage.service;

import subak.myPage.dao.MyPageDao;
import subak.myPage.model.MemberVO;

public class MPUpdateMemberServiceImpl implements MPUpdateMemberService {
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
	public MemberVO getMemberInfo(String userID) {
		return this.myPageDao.getMemberInfo(userID);
	}

	@Override
	public void updateMemberInfo(MemberVO memberVO) {
		this.myPageDao.updateMemberInfo(memberVO);
	}

	@Override
	public String getPass(String userID) {
		return this.myPageDao.getPass(userID);
	}

}