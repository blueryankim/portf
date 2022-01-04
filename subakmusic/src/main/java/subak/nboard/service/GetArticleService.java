package subak.nboard.service;

import subak.nboard.model.BoardVO;

public interface GetArticleService {
	BoardVO getArticle(Integer num);

	String getArticle_type(Integer num);
}
