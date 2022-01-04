package subak.fboard.service;

import subak.fboard.model.FBoardVO;

public interface FGetArticleService {
	FBoardVO getArticle(Integer num);

	String getArticle_type(Integer num);
}
