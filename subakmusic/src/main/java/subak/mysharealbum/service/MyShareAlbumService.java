package subak.mysharealbum.service;

import subak.mysharealbum.model.GetAlbumInforVO;
import subak.mysharealbum.model.MyShareAlbumVO;

public interface MyShareAlbumService {

	public MyShareAlbumVO myShareAlbum(int listnum);
	public GetAlbumInforVO getAlbumInfor(int albumnum);
}
