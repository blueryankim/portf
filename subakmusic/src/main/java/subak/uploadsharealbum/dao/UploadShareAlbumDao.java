package subak.uploadsharealbum.dao;

import subak.uploadsharealbum.model.UploadShareAlbumVO;

public interface UploadShareAlbumDao {

	public void uploadShareAlbum(UploadShareAlbumVO uploadsharealbumvo);
	public int getShareAlbumNum(String id);
}
