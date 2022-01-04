package subak.download.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import subak.download.model.DownloadVO;


public class DownloadDaoImpl extends SqlMapClientDaoSupport implements DownloadDao {

	@Override
	public DownloadVO getSongInfor(int songnum){
		
		return (DownloadVO)getSqlMapClientTemplate().queryForObject("downloadSql.getSongInfor",songnum);
	}

	
}
