package subak.musicplayer.service;
import subak.musicplayer.dao.MusicPlayerDao;
import subak.musicplayer.model.MusicPlayerVO;

public class MusicPlayerServiceImpl implements MusicPlayerService {
	
	/**
	 * @uml.property  name="musicplayerdao"
	 * @uml.associationEnd  
	 */
	private MusicPlayerDao musicplayerdao;
	@Override
	public MusicPlayerVO getPlayerList(int songnum) {
		
		return musicplayerdao.getPlayerList(songnum);
	}
	
	/**
	 * @param musicplayerdao
	 * @uml.property  name="musicplayerdao"
	 */
	public void setMusicplayerdao(MusicPlayerDao musicplayerdao) {
		this.musicplayerdao = musicplayerdao;
	}
	
	/**
	 * @return
	 * @uml.property  name="musicplayerdao"
	 */
	public MusicPlayerDao getMusicplayerdao() {
		return musicplayerdao;
	}
	
}
