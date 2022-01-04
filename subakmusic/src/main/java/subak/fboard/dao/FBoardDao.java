package subak.fboard.dao;

import java.util.List;

import subak.fboard.model.FBoardVO;


public interface FBoardDao {
	int getListCount(Object obj); // ��ü �� �� or �˻��� �� ��

	List<FBoardVO> getList(Object obj); // ��ü �� or �˻��� �� ����Ʈ

	void insertArticle(FBoardVO boarVo); // �� �Է�

	FBoardVO getArticle(Integer num);// �� ��������

	void updateArticle(FBoardVO boardVo); // �� �Է�

	String getPass(Integer num); // ��й�ȣ ��������

	public String getArticle_type(Integer num); // ��Ÿ�� ��������

	void deleteArticle(Integer num); // �ۻ���
	
	List<FBoardVO> getListForAdmin(Object obj);
	int getListCountForAdmin(Object obj);
}
