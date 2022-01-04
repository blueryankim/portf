package subak.qboard.dao;

import java.util.List;

import subak.qboard.model.QBoardVO;


public interface QBoardDao {
	int getListCount(Object obj); // ��ü �� �� or �˻��� �� ��

	List<QBoardVO> getList(Object obj); // ��ü �� or �˻��� �� ����Ʈ

	void insertArticle(QBoardVO boarVo); // �� �Է�

	QBoardVO getArticle(Integer num);// �� ��������

	void updateArticle(QBoardVO boardVo); // �� �Է�

	String getPass(Integer num); // ��й�ȣ ��������

	public String getArticle_type(Integer num); // ��Ÿ�� ��������

	void deleteArticle(Integer num); // �ۻ���
}
