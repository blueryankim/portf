package subak.linkmedia.service;

import java.util.List;

import subak.linkmedia.dao.LinkMediaDao;
import subak.linkmedia.model.LinkMediaVO;

public class LinkMediaServiceImpl implements LinkMediaService {

	/**
	 * @uml.property  name="linkmediadao"
	 * @uml.associationEnd  
	 */
	private LinkMediaDao linkmediadao;
	
	@Override
	public int getLinkMediaCount(Object obj) {
	
		return linkmediadao.getLinkMediaCount(obj);
	}
	
	@Override
	public List<LinkMediaVO> getLinkMediaList(Object obj) {
		
		return linkmediadao.getLinkMediaList(obj);
	}
	
	@Override
	public String getChoosedMediaAddr(int choosedmediaid) {
		
		return linkmediadao.getChoosedMediaAddr(choosedmediaid);
	}


	
	/**
	 * @return
	 * @uml.property  name="linkmediadao"
	 */
	public LinkMediaDao getLinkmediadao() {
		return linkmediadao;
	}

	/**
	 * @param linkmediadao
	 * @uml.property  name="linkmediadao"
	 */
	public void setLinkmediadao(LinkMediaDao linkmediadao) {
		this.linkmediadao = linkmediadao;
	}

	


	

}
