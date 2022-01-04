package subak.fboard.service;

import subak.fboard.model.FBoardVO;

public interface FUpdateArticleService {
	FBoardVO getArticle(Integer num);

	String getPass(Integer num);

	void updateArticle(FBoardVO boardVo);
}
