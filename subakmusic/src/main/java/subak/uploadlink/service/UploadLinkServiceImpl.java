package subak.uploadlink.service;

import subak.uploadlink.dao.UploadLinkDao;
import subak.uploadlink.model.UploadLinkVO;

public class UploadLinkServiceImpl implements UploadLinkService {

	/**
	 * @uml.property  name="uploadlinkdao"
	 * @uml.associationEnd  
	 */
	private UploadLinkDao uploadlinkdao;
	@Override
	public void insertUploadLink(UploadLinkVO uploadlinkvo) {
		
		uploadlinkdao.insertUploadLink(uploadlinkvo);
	}
	

	@Override
	public int getLinkNum(Object obj) {
		
		return uploadlinkdao.getLinkNum(obj);
	}
	
	/**
	 * @return
	 * @uml.property  name="uploadlinkdao"
	 */
	public UploadLinkDao getUploadlinkdao() {
		return uploadlinkdao;
	}
	/**
	 * @param uploadlinkdao
	 * @uml.property  name="uploadlinkdao"
	 */
	public void setUploadlinkdao(UploadLinkDao uploadlinkdao) {
		this.uploadlinkdao = uploadlinkdao;
	}


	
	
	

}
