package subak.nboard.dao;

import java.util.List;
import subak.nboard.model.BoardVO;

public interface BoardDao {
	int getListCount(Object obj); // ��ü �� �� or �˻��� �� ��
	List<BoardVO> getList(Object obj); // ��ü �� or �˻��� �� ����Ʈ
	void insertArticle(BoardVO boarVo); // �� �Է�
	BoardVO getArticle(Integer num);// �� ��������
	void updateArticle(BoardVO boardVo); // �� �Է�
	String getPass(Integer num); // ��й�ȣ ��������
	public String getArticle_type(Integer num); // ��Ÿ�� ��������
	void deleteArticle(Integer num); // �ۻ���
}