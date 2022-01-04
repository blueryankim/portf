package subak.home.service;

import subak.home.model.MemberVO;
public interface LoginService {

	String getPass(String id);
	
	MemberVO getMemberInfo(String id);
}
