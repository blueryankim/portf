package hooray.joinmember.dao;

import hooray.joinmember.model.JoinMemberVO;

public interface JoinMemberDao {

	public void insertMember(JoinMemberVO joinMemberVO);
	public int confirmJoined(String email);
	public void makeMemberTable(String email);
}
