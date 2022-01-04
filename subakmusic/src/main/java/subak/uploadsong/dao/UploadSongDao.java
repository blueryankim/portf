package subak.uploadsong.dao;
import subak.uploadsong.model.UploadSongVO;

public interface UploadSongDao {

	public void registerSong(UploadSongVO uploadsongvo);
	public int getSongNum(Object obj);
}
