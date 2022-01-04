package subak.uploadsong.dao;


import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.uploadsong.model.UploadSongVO;
public class UploadSongDaoImpl extends SqlMapClientDaoSupport implements
		UploadSongDao {

	@Override
	public void registerSong(UploadSongVO uploadsongVo) {
		getSqlMapClientTemplate().insert("uploadsongSql.insertSong",
				uploadsongVo);

	}

	@Override
	public int getSongNum(Object obj) {
		// Map<String,String> getsongnum=new HashMap<String,String>();
		// getsongnum=(Map<String,String>)obj;
		return ((Integer) getSqlMapClientTemplate().queryForObject(
				"uploadsongSql.getSongNum", obj)).intValue();

		/*
		 * if (map.get("search_type").equals("writer")) { return ((Integer)
		 * getSqlMapClientTemplate().queryForObject( "boardSql.getWriterCount",
		 * obj)).intValue(); return 0;
		 */
	}

}
