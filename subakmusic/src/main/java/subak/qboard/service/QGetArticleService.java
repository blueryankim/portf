package subak.qboard.service;

import subak.qboard.model.QBoardVO;

public interface QGetArticleService {
	QBoardVO getArticle(Integer num);

	String getArticle_type(Integer num);
}
