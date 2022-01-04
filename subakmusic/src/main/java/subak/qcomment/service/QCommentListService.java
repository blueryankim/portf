package subak.qcomment.service;

import java.util.List;

import subak.qcomment.model.QCommentVO;


public interface QCommentListService {
	List<QCommentVO>getMessageList(int pageNum,int num);
}
