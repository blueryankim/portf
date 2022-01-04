package hooray.joinmember.service;

import hooray.joinmember.dao.JoinMemberDao;
import hooray.joinmember.model.JoinMemberVO;

public class JoinMemberServiceImpl implements JoinMemberService{
	
	private JoinMemberDao joinMemberDao;
	

	@Override
	public int insertMemberAndConfirm(JoinMemberVO joinmemberVO) {
		joinMemberDao.insertMember(joinmemberVO);
		return joinMemberDao.confirmJoined(joinmemberVO.getEmail());
	
	}
	
	@Override
	public void makeMemberTable(String email) {
		joinMemberDao.makeMemberTable(email);
		
	}

	public JoinMemberDao getJoinmeMberDao() {
		return joinMemberDao;
	}

	public void setJoinmeMberDao(JoinMemberDao joinmeMberDao) {
		this.joinMemberDao = joinmeMberDao;
	}

	

	
	
	

}
