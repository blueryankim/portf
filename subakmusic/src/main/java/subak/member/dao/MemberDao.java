package subak.member.dao;
import java.util.List;

import subak.member.model.MemberVO;
public interface MemberDao {
	void insertMember(MemberVO memberVO);
	Integer selectId(String id);//���̵� �ߺ�Ȯ��
	List<MemberVO> getList(Object obj);
	int getListCount(Object obj);
	void deleteMember(String id);
	
	/*int getListCount(Object obj);//��ü ȸ�� ��
	List <MemberVO> getList(Object obj);//��ü ȸ����
	
	MemberVO getMember(Integer num);
	void updateMember(MemberVO memberVO);//ȸ�� ����ϱ�
	String getId(String id);//���̵� ��������
	 public String getId_type(String id);//ȸ�� Ÿ�� ��������
	 void deleteMember(Integer num);//ȸ������
	List<MemberVO> getAllMemberList();*/
}