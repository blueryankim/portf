package hooray.joinmember.service;

import hooray.joinmember.model.JoinMemberVO;

public interface JoinMemberService {
	
	public int insertMemberAndConfirm(JoinMemberVO joinmemberVO);
	public void makeMemberTable(String email);

}
