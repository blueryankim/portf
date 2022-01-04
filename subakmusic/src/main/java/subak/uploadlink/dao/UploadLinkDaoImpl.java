package subak.uploadlink.dao;

import subak.uploadlink.model.UploadLinkVO;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class UploadLinkDaoImpl extends SqlMapClientDaoSupport implements UploadLinkDao {

	@Override
	public void insertUploadLink(UploadLinkVO uploadlinkvo) {
		
			getSqlMapClientTemplate().insert(
				"uploadlinkSql.insertLinkMedia", uploadlinkvo);
	}

	@Override
	public int getLinkNum(Object obj) {
		
		return ((Integer)getSqlMapClientTemplate().queryForObject("uploadlinkSql.getLinkNum",obj)).intValue();
	}
	
	
	
	

}
