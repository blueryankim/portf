package subak.qboard.dao;

import java.util.List;

import subak.qboard.model.QBoardVO;


public interface QBoardDao {
	int getListCount(Object obj); // 전체 글 수 or 검색한 글 수

	List<QBoardVO> getList(Object obj); // 전체 글 or 검색한 글 리스트

	void insertArticle(QBoardVO boarVo); // 글 입력

	QBoardVO getArticle(Integer num);// 글 가져오기

	void updateArticle(QBoardVO boardVo); // 글 입력

	String getPass(Integer num); // 비밀번호 가져오기

	public String getArticle_type(Integer num); // 글타입 가져오기

	void deleteArticle(Integer num); // 글삭제
}
