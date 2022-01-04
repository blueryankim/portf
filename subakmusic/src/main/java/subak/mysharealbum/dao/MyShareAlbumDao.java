package subak.mysharealbum.dao;

import subak.mysharealbum.model.GetAlbumInforVO;
import subak.mysharealbum.model.MyShareAlbumVO;

public interface MyShareAlbumDao {

	public MyShareAlbumVO myShareAlbum(int listnum);
	public GetAlbumInforVO getAlbumInfor(int albumnum);
}
