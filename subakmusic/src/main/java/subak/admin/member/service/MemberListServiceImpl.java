package subak.admin.member.service;

import java.util.List;

import subak.member.dao.MemberDao;
import subak.member.model.MemberVO;

public class MemberListServiceImpl implements MemberListService {
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
	public List<MemberVO> getMemberList(Object obj) {
		return memberDao.getList(obj);
	}

	@Override
	public Integer getListCount(Object obj) {
		return memberDao.getListCount(obj);
	}
}
