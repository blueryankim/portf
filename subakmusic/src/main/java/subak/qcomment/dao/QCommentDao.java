package subak.qcomment.dao;

import java.util.List;

import subak.qcomment.model.QCommentVO;


public interface QCommentDao {
	public int count();
	public int nextVal();
	public List<QCommentVO>select(int begin,int end,int num);
	public void insert(QCommentVO message);
	public void delete(int id);
	public void update(QCommentVO message);
}
