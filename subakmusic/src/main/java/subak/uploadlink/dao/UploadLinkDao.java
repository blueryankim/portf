package subak.uploadlink.dao;

import subak.uploadlink.model.UploadLinkVO;

public interface UploadLinkDao {

	public void insertUploadLink(UploadLinkVO uploadlinkvo);
	public int getLinkNum(Object obj);
}
