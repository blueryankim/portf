package subak.albuminforcomment.dao;

import java.util.List;

import subak.albuminforcomment.model.AlbumInforCommentVO;

public interface AlbumInforCommentDao {

	public List<AlbumInforCommentVO> getAlbumInforComments(Object albumnum);
	public void insertAlbumInforComment(AlbumInforCommentVO commentVO);
	public List<AlbumInforCommentVO> getAlbumInforComment(Object obj);
	public int getCommentCount(int albumnum);
	public void deleteAlbumInforComment(Object obj);

}


