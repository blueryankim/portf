package subak.musicplayer.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.musicplayer.model.MusicPlayerVO;

public class MusicPlayerDaoImpl extends SqlMapClientDaoSupport implements
		MusicPlayerDao {

	@Override
	public MusicPlayerVO getPlayerList(int songnum) {

		return (MusicPlayerVO) getSqlMapClientTemplate().queryForObject(
				"musicplayerSql.getPlayerList", songnum);

	}
}
