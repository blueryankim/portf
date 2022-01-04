package subak.fcomment.service;

import java.util.List;

import subak.fcomment.model.FCommentVO;


public interface FCommentListService {
	List<FCommentVO>getMessageList(int pageNum,int num);
}
