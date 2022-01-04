package subak.albuminforcomment.service;

import java.util.List;
import subak.albuminforcomment.model.AlbumInforCommentVO;

public interface AlbumInforCommentService {

	public List<AlbumInforCommentVO> getAlbumInforComments(Object albumnum);
	public void insertAlbumInforComment(AlbumInforCommentVO commentVO);
	public List<AlbumInforCommentVO> getAlbumInforComment(Object obj);
	public int getCommentCount(int albumnum);
	public void deleteAlbumInforComment(Object obj);
}







