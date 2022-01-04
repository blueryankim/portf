package subak.member.service;

import subak.member.dao.MemberDao;

public class IdCheckServiceImpl implements IdCheckService {
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
	public Integer selectId(String id) {
		return this.memberDao.selectId(id);
	}
	
}