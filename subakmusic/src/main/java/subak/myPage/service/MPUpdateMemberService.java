package subak.myPage.service;

import subak.myPage.model.MemberVO;

public interface MPUpdateMemberService {
	MemberVO getMemberInfo(String userID);
	void updateMemberInfo(MemberVO memberVO);
	String getPass(String userID);
}