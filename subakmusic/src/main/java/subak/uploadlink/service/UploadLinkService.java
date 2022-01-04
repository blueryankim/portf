package subak.uploadlink.service;

import subak.uploadlink.model.UploadLinkVO;

public interface UploadLinkService {

	public void insertUploadLink(UploadLinkVO uploadlinkvo);
	public int getLinkNum(Object obj);
}
