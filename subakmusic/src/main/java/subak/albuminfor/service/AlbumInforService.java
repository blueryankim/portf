package subak.albuminfor.service;

import java.util.List;

import subak.albuminfor.model.AlbumInforVO;
import subak.albuminfor.model.GetSingerAndAlbumVO;


public interface AlbumInforService {

	public GetSingerAndAlbumVO getSingerAndAlbum(int songnum);
	public List<AlbumInforVO> getAlbumInfor(Object obj);
	
}


