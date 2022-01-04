package subak.albuminfor.dao;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.albuminfor.model.AlbumInforVO;
import subak.albuminfor.model.GetSingerAndAlbumVO;


public class AlbumInforDaoImpl extends SqlMapClientDaoSupport implements AlbumInforDao{

	

	public GetSingerAndAlbumVO getSingerAndAlbum(int songnum) {
		
		return (GetSingerAndAlbumVO)(getSqlMapClientTemplate().queryForObject("albuminforSql.getSingerAndAlbum",songnum));
	}

	
	@SuppressWarnings("unchecked")
	public List<AlbumInforVO> getAlbumInfor(Object obj) {
		
		return getSqlMapClientTemplate().queryForList("albuminforSql.albumInfor",obj);
	}

	
	
}
