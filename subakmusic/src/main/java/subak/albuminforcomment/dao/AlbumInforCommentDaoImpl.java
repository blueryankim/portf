package subak.albuminforcomment.dao;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.albuminforcomment.model.AlbumInforCommentVO;
public class AlbumInforCommentDaoImpl extends SqlMapClientDaoSupport implements AlbumInforCommentDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<AlbumInforCommentVO> getAlbumInforComments(Object albumnum) {
		
		return getSqlMapClientTemplate().queryForList("albuminforcommentSql.getAlbumInforComments",albumnum);
	}

	@Override
	public void insertAlbumInforComment(AlbumInforCommentVO commentVO) {
			getSqlMapClientTemplate().insert("albuminforcommentSql.insertAlbumInforComment",commentVO);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AlbumInforCommentVO> getAlbumInforComment(Object obj) {
		return getSqlMapClientTemplate().queryForList("albuminforcommentSql.getAlbumInforComment",obj);
	 
	}

	@Override
	
	public int getCommentCount(int albumnum) {
		return ((Integer)getSqlMapClientTemplate().queryForObject("albuminforcommentSql.getCommentCount",albumnum)).intValue();
	}

	@Override
	public void deleteAlbumInforComment(Object obj) {
		getSqlMapClientTemplate().delete("albuminforcommentSql.deleteAlbumInforComment",obj);
		
	}

	
	
	
}
