package subak.nboard.service;

import subak.nboard.model.BoardVO;

public interface UpdateArticleService {
	BoardVO getArticle(Integer num);
	String getPass(Integer num);
	void updateArticle(BoardVO boardVo);
}
