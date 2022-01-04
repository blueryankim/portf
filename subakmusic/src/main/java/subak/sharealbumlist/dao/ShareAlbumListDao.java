package subak.sharealbumlist.dao;

import java.util.List;

import subak.sharealbumlist.model.ShareAlbumListVO;

public interface ShareAlbumListDao {

	public int getShareAlbumCount();
	public List<ShareAlbumListVO> getShareAlbumList(Object obj);
	public List<ShareAlbumListVO> getPopAlbumList();
}
