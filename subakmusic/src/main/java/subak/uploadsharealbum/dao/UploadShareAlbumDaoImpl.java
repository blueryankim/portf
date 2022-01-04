package subak.uploadsharealbum.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.uploadsharealbum.model.UploadShareAlbumVO;

public class UploadShareAlbumDaoImpl extends SqlMapClientDaoSupport implements UploadShareAlbumDao {

	@Override
	public void uploadShareAlbum(UploadShareAlbumVO uploadsharealbumvo) {
		
		getSqlMapClientTemplate().insert("uploadsharealbumSql.uploadShareAlbum",uploadsharealbumvo);
		 
	}

	@Override
	public int getShareAlbumNum(String id) {
		
		return ((Integer)getSqlMapClientTemplate().queryForObject("uploadsharealbumSql.getShareAlbumNum",id));
		
	}
	
	

}
