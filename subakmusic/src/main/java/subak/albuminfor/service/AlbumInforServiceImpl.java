package subak.albuminfor.service;

import java.util.List;
import subak.albuminfor.dao.AlbumInforDao;
import subak.albuminfor.model.AlbumInforVO;
import subak.albuminfor.model.GetSingerAndAlbumVO;

public class AlbumInforServiceImpl implements AlbumInforService {

	/**
	 * @uml.property  name="albuminfordao"
	 * @uml.associationEnd  
	 */
	private AlbumInforDao albuminfordao;
	@Override
	public GetSingerAndAlbumVO getSingerAndAlbum(int songnum) {
		
		return albuminfordao.getSingerAndAlbum(songnum);
		 
	}

	@Override
	public List<AlbumInforVO> getAlbumInfor(Object obj) {
		
		return albuminfordao.getAlbumInfor(obj);
	}

	
	/**
	 * @return
	 * @uml.property  name="albuminfordao"
	 */
	public AlbumInforDao getAlbuminfordao() {
		return albuminfordao;
	}

	/**
	 * @param albuminfordao
	 * @uml.property  name="albuminfordao"
	 */
	public void setAlbuminfordao(AlbumInforDao albuminfordao) {
		this.albuminfordao = albuminfordao;
	}

	
	
	
	

}
