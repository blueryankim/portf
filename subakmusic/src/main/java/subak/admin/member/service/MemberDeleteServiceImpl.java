package subak.admin.member.service;

import subak.member.dao.MemberDao;

public class MemberDeleteServiceImpl implements MemberDeleteService {
	/**
	 * @uml.property  name="memberDao"
	 * @uml.associationEnd  
	 */
	public MemberDao memberDao;
	
	
	/**
	 * @param memberDao
	 * @uml.property  name="memberDao"
	 */
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}


	@Override
	public void deleteMember(String id) {
		memberDao.deleteMember(id);
	}

}
