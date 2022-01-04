package subak.admin.member.service;

import java.util.List;

import subak.member.model.MemberVO;

public interface MemberListService {
	List<MemberVO> getMemberList(Object obj);
	Integer getListCount(Object obj);
}
