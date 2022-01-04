package subak.home.dao;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.home.model.ShareAlbumListVO;

public class ShareAlbumListDaoImpl extends SqlMapClientDaoSupport implements ShareAlbumListDao{

	@SuppressWarnings("unchecked")
	@Override
	public List<ShareAlbumListVO> getShareAlbumList(Object obj) {
		
		return getSqlMapClientTemplate().queryForList("getsharealbumlist2Sql.getShareAlbumList2",obj);
	}													

	
}
