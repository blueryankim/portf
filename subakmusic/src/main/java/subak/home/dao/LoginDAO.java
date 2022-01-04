package subak.home.dao;

import subak.home.model.MemberVO;

public interface LoginDAO {

	String getPass(String id);
	
	MemberVO getMemberInfo(String id);
	
}
