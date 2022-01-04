package subak.home.service;

import java.util.List;

import subak.home.dao.ShareAlbumListDao;
import subak.home.model.ShareAlbumListVO;

public class ShareAlbumListServiceImpl implements ShareAlbumListService {

	private ShareAlbumListDao sharealbumlistdao;
	@Override
	public List<ShareAlbumListVO> getShareAlbumList(Object obj) {
		// TODO Auto-generated method stub
		return sharealbumlistdao.getShareAlbumList(obj);
	}
	public ShareAlbumListDao getSharealbumlistdao() {
		return sharealbumlistdao;
	}
	public void setSharealbumlistdao(ShareAlbumListDao sharealbumlistdao) {
		this.sharealbumlistdao = sharealbumlistdao;
	}
	
	

	
}
