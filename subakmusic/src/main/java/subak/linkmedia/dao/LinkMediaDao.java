package subak.linkmedia.dao;

import java.util.List;
import subak.linkmedia.model.LinkMediaVO;

public interface LinkMediaDao {

	public List<LinkMediaVO> getLinkMediaList(Object obj);
	public int getLinkMediaCount(Object obj);
	public String getChoosedMediaAddr(int choosedmediaid);
}
