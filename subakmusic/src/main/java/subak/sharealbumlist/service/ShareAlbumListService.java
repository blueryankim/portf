package subak.sharealbumlist.service;

import java.util.List;

import subak.sharealbumlist.model.ShareAlbumListVO;

public interface ShareAlbumListService {

	public int getShareAlbumCount();
	public List<ShareAlbumListVO> getShareAlbumList(Object obj);
	public List<ShareAlbumListVO> getPopAlbumList(); 
}
