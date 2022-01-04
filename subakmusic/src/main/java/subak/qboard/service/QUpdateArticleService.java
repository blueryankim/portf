package subak.qboard.service;

import subak.qboard.model.QBoardVO;

public interface QUpdateArticleService {
	QBoardVO getArticle(Integer num);

	String getPass(Integer num);

	void updateArticle(QBoardVO boardVo);
}
