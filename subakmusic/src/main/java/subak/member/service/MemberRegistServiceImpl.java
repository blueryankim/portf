package subak.member.service;

import subak.member.dao.MemberDao;
import subak.member.model.MemberVO;

public class MemberRegistServiceImpl implements MemberRegistService {
	/**
	 * @uml.property  name="memberDao"
	 * @uml.associationEnd  
	 */
	private MemberDao memberDao;
	
	/**
	 * @param memberDao
	 * @uml.property  name="memberDao"
	 */
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public void insertMember(MemberVO memberVO) {
		this.memberDao.insertMember(memberVO);
	}
	
}
