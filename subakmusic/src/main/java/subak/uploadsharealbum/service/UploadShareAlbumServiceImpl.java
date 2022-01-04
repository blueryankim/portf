package subak.uploadsharealbum.service;

import subak.uploadsharealbum.dao.UploadShareAlbumDao;
import subak.uploadsharealbum.model.UploadShareAlbumVO;

public class UploadShareAlbumServiceImpl implements UploadShareAlbumService {

	/**
	 * @uml.property  name="uploadsharealbumdao"
	 * @uml.associationEnd  
	 */
	private UploadShareAlbumDao uploadsharealbumdao;
	@Override
	public void uploadShareAlbum(UploadShareAlbumVO uploadsharealbumvo) {
		uploadsharealbumdao.uploadShareAlbum(uploadsharealbumvo);
	}
	
	@Override
	public int getShareAlbumNum(String id) {
		return uploadsharealbumdao.getShareAlbumNum(id);
	}
	
	/**
	 * @return
	 * @uml.property  name="uploadsharealbumdao"
	 */
	public UploadShareAlbumDao getUploadsharealbumdao() {
		return uploadsharealbumdao;
	}
	/**
	 * @param uploadsharealbumdao
	 * @uml.property  name="uploadsharealbumdao"
	 */
	public void setUploadsharealbumdao(UploadShareAlbumDao uploadsharealbumdao) {
		this.uploadsharealbumdao = uploadsharealbumdao;
	}



	

	
}
