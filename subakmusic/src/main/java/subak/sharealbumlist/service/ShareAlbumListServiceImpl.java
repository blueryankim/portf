package subak.sharealbumlist.service;

import java.util.List;

import subak.sharealbumlist.dao.ShareAlbumListDao;
import subak.sharealbumlist.model.ShareAlbumListVO;

public class ShareAlbumListServiceImpl implements ShareAlbumListService{

	/**
	 * @uml.property  name="sharealbumlistdao"
	 * @uml.associationEnd  
	 */
	private ShareAlbumListDao sharealbumlistdao;
	@Override
	public int getShareAlbumCount() {
		
		return sharealbumlistdao.getShareAlbumCount();
	}
	

	@Override
	public List<ShareAlbumListVO> getShareAlbumList(Object obj) {
		
		return sharealbumlistdao.getShareAlbumList(obj);
	}
	
	@Override
	public List<ShareAlbumListVO> getPopAlbumList() {
		return sharealbumlistdao.getPopAlbumList();
	}

	
	/**
	 * @return
	 * @uml.property  name="sharealbumlistdao"
	 */
	public ShareAlbumListDao getSharealbumlistdao() {
		return sharealbumlistdao;
	}
	/**
	 * @param sharealbumlistdao
	 * @uml.property  name="sharealbumlistdao"
	 */
	public void setSharealbumlistdao(ShareAlbumListDao sharealbumlistdao) {
		this.sharealbumlistdao = sharealbumlistdao;
	}


	


	
	
	
}
