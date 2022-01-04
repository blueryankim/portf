package subak.mysharealbum.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.mysharealbum.model.GetAlbumInforVO;
import subak.mysharealbum.model.MyShareAlbumVO;

public class MyShareAlbumDaoImpl extends SqlMapClientDaoSupport implements MyShareAlbumDao {

	@Override
	public MyShareAlbumVO myShareAlbum(int listnum) {
		
		getSqlMapClientTemplate().update("mysharealbumSql.upReadCount",listnum);
		return (MyShareAlbumVO)getSqlMapClientTemplate().queryForObject("mysharealbumSql.myShareAlbum",listnum);
	}

	@Override
	public GetAlbumInforVO getAlbumInfor(int albumnum) {
		// TODO Auto-generated method stub
		return (GetAlbumInforVO)getSqlMapClientTemplate().queryForObject("mysharealbumSql.getAlbumInfor",albumnum);
	}
	
}
