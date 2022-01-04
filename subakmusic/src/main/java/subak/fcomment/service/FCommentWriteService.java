package subak.fcomment.service;

import subak.fcomment.model.FCommentVO;

public interface FCommentWriteService {
	int nexVal();
	FCommentVO write(FCommentVO message);
}
