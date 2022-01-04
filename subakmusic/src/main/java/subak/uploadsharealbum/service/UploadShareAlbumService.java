package subak.uploadsharealbum.service;

import subak.uploadsharealbum.model.UploadShareAlbumVO;

public interface UploadShareAlbumService {

	public void uploadShareAlbum(UploadShareAlbumVO uploadsharealbumvo);
	public int getShareAlbumNum(String id);
}
