package subak.fcomment.dao;

import java.util.List;

import subak.fcomment.model.FCommentVO;


public interface FCommentDao {
	public int count();
	public int nextVal();
	public List<FCommentVO>select(int begin,int end,int num);
	public void insert(FCommentVO message);
	public void delete(int id);
	public void update(FCommentVO message);
}
