package subak.sharealbumlist.dao;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.sharealbumlist.model.ShareAlbumListVO;

public class ShareAlbumListDaoImpl extends SqlMapClientDaoSupport implements ShareAlbumListDao {

	@Override
	public int getShareAlbumCount() {
		
		return ((Integer)getSqlMapClientTemplate().queryForObject("sharealbumlistSql.getShareAlbumCount")).intValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShareAlbumListVO> getShareAlbumList(Object obj) {
		
		return getSqlMapClientTemplate().queryForList("sharealbumlistSql.getShareAlbumList",obj);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShareAlbumListVO> getPopAlbumList() {
		
		return getSqlMapClientTemplate().queryForList("sharealbumlistSql.getPopAlbumList");
	}

	
	
}
