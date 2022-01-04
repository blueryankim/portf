package subak.download.service;

import subak.download.dao.DownloadDao;
import subak.download.model.DownloadVO;

public class DownloadServiceImpl implements DownloadService{

	/**
	 * @uml.property  name="downloaddao"
	 * @uml.associationEnd  
	 */
	private DownloadDao downloaddao;
	@Override
	public DownloadVO getSongInfor(int songnum) {
		
		return downloaddao.getSongInfor(songnum);
	}
	/**
	 * @return
	 * @uml.property  name="downloaddao"
	 */
	public DownloadDao getDownloaddao() {
		return downloaddao;
	}
	/**
	 * @param downloaddao
	 * @uml.property  name="downloaddao"
	 */
	public void setDownloaddao(DownloadDao downloaddao) {
		this.downloaddao = downloaddao;
	}

	
	
	
}
