package subak.albuminfor.dao;

import java.util.List;

import subak.albuminfor.model.AlbumInforVO;
import subak.albuminfor.model.GetSingerAndAlbumVO;


public interface AlbumInforDao {

public GetSingerAndAlbumVO getSingerAndAlbum(int songnum);
public List<AlbumInforVO> getAlbumInfor(Object obj);

}