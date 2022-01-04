package subak.member.dao;
import java.util.List;

import subak.member.model.MemberVO;
public interface MemberDao {
	void insertMember(MemberVO memberVO);
	Integer selectId(String id);//아이디 중복확인
	List<MemberVO> getList(Object obj);
	int getListCount(Object obj);
	void deleteMember(String id);
	
	/*int getListCount(Object obj);//전체 회원 수
	List <MemberVO> getList(Object obj);//전체 회원수
	
	MemberVO getMember(Integer num);
	void updateMember(MemberVO memberVO);//회원 등록하기
	String getId(String id);//아이디 가져오기
	 public String getId_type(String id);//회원 타입 가져오기
	 void deleteMember(Integer num);//회원삭제
	List<MemberVO> getAllMemberList();*/
}