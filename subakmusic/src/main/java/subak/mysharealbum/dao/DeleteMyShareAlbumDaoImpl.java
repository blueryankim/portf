package subak.mysharealbum.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class DeleteMyShareAlbumDaoImpl extends SqlMapClientDaoSupport implements DeleteMyShareAlbumDao {

	@Override
	public void deleteMyShareAlbum(int listnum) {
		getSqlMapClientTemplate().delete("deletemysharealbumSql.deleteMyShareAlbum",listnum);
		
	}

	
}
