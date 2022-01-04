package subak.fboard.dao;

import java.util.List;

import subak.fboard.model.FBoardVO;


public interface FBoardDao {
	int getListCount(Object obj); // 전체 글 수 or 검색한 글 수

	List<FBoardVO> getList(Object obj); // 전체 글 or 검색한 글 리스트

	void insertArticle(FBoardVO boarVo); // 글 입력

	FBoardVO getArticle(Integer num);// 글 가져오기

	void updateArticle(FBoardVO boardVo); // 글 입력

	String getPass(Integer num); // 비밀번호 가져오기

	public String getArticle_type(Integer num); // 글타입 가져오기

	void deleteArticle(Integer num); // 글삭제
	
	List<FBoardVO> getListForAdmin(Object obj);
	int getListCountForAdmin(Object obj);
}
