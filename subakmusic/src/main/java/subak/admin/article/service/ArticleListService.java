package subak.admin.article.service;

import java.util.List;

import subak.fboard.model.FBoardVO;

public interface ArticleListService {
	List<FBoardVO> getArticleList(Object obj);
	Integer getArticleCount(Object obj);
}
