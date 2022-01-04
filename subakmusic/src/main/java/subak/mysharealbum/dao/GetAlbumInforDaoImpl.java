package subak.mysharealbum.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.mysharealbum.model.GetAlbumInforVO;

public class GetAlbumInforDaoImpl extends SqlMapClientDaoSupport implements GetAlbumInforDao {

	@Override
	public GetAlbumInforVO getAlbumInfor(int albumnum) {
		// TODO Auto-generated method stub
		return (GetAlbumInforVO)getSqlMapClientTemplate().queryForObject("mysharealbumSql.getAlbumInfor",albumnum);
	}

	
}
