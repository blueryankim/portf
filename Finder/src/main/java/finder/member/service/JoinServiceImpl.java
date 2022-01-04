package finder.member.service;

import finder.member.dao.JoinDao;
import finder.member.model.JoinVO;

public class JoinServiceImpl implements JoinService{
	
	private JoinDao joindao;

	public void addMember(JoinVO joinVO){
		
		joindao.addMember(joinVO);
		
	}

	public JoinDao getJoindao() {
		return joindao;
	}

	public void setJoindao(JoinDao joindao) {
		this.joindao = joindao;
	}
	
	
}
