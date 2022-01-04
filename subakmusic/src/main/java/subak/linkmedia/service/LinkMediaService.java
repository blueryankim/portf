package subak.linkmedia.service;

import java.util.List;

import subak.linkmedia.model.LinkMediaVO;

public interface LinkMediaService {

	public int getLinkMediaCount(Object obj);
	public List<LinkMediaVO> getLinkMediaList(Object obj);
	public String getChoosedMediaAddr(int choosedmediaid);
	
}
