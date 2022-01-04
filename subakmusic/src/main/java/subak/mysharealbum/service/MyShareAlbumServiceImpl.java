package subak.mysharealbum.service;

import subak.mysharealbum.dao.MyShareAlbumDao;
import subak.mysharealbum.model.GetAlbumInforVO;
import subak.mysharealbum.model.MyShareAlbumVO;

public class MyShareAlbumServiceImpl implements MyShareAlbumService{

	
	/**
	 * @uml.property  name="mysharealbumdao"
	 * @uml.associationEnd  
	 */
	private MyShareAlbumDao mysharealbumdao;
	@Override
	public MyShareAlbumVO myShareAlbum(int listnum) {
			return mysharealbumdao.myShareAlbum(listnum);
	}
	public GetAlbumInforVO getAlbumInfor(int albumnum) {
		
		return mysharealbumdao.getAlbumInfor(albumnum);
	}
	
	/**
	 * @return
	 * @uml.property  name="mysharealbumdao"
	 */
	public MyShareAlbumDao getMysharealbumdao() {
		return mysharealbumdao;
	}
	/**
	 * @param mysharealbumdao
	 * @uml.property  name="mysharealbumdao"
	 */
	public void setMysharealbumdao(MyShareAlbumDao mysharealbumdao) {
		this.mysharealbumdao = mysharealbumdao;
	}
	
	

	
}
