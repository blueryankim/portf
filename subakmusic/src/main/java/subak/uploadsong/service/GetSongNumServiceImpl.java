package subak.uploadsong.service;
import subak.uploadsong.dao.UploadSongDao;
public class GetSongNumServiceImpl implements GetSongNumService{

	/**
	 * @uml.property  name="uploadsongdao"
	 * @uml.associationEnd  
	 */
	private UploadSongDao uploadsongdao;
	@Override
	public int getSongNum(Object obj) {
		
		return uploadsongdao.getSongNum(obj);
	}
	/**
	 * @return
	 * @uml.property  name="uploadsongdao"
	 */
	public UploadSongDao getUploadsongdao() {
		return uploadsongdao;
	}
	/**
	 * @param uploadsongdao
	 * @uml.property  name="uploadsongdao"
	 */
	public void setUploadsongdao(UploadSongDao uploadsongdao) {
		this.uploadsongdao = uploadsongdao;
	}
	
	
	

}
