package subak.mysharealbum.service;

import subak.mysharealbum.dao.GetAlbumInforDao;
import subak.mysharealbum.model.GetAlbumInforVO;

public class GetAlbumInforServiceImpl implements GetAlbumInforService{

	/**
	 * @uml.property  name="getalbuminfordao"
	 * @uml.associationEnd  
	 */
	private GetAlbumInforDao getalbuminfordao;
	@Override
	public GetAlbumInforVO getAlbumInfor(int albumnum) {
	
		return getalbuminfordao.getAlbumInfor(albumnum);
	}
	/**
	 * @return
	 * @uml.property  name="getalbuminfordao"
	 */
	public GetAlbumInforDao getGetalbuminfordao() {
		return getalbuminfordao;
	}
	/**
	 * @param getalbuminfordao
	 * @uml.property  name="getalbuminfordao"
	 */
	public void setGetalbuminfordao(GetAlbumInforDao getalbuminfordao) {
		this.getalbuminfordao = getalbuminfordao;
	}
	
	

	
}
