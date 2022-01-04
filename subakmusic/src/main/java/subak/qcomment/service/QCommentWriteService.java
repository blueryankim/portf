package subak.qcomment.service;

import subak.qcomment.model.QCommentVO;

public interface QCommentWriteService {
	int nexVal();
	QCommentVO write(QCommentVO message);
}
