package circle.member.service;

import circle.member.dao.JoinDao;
import circle.member.model.JoinVO;

public class JoinServiceImpl implements JoinService {

	private JoinDao joindao;
	@Override
	public void insertMember(JoinVO joinVO) {
		joindao.insertMember(joinVO);
		
	}
	public void setJoindao(JoinDao joindao) {
		this.joindao = joindao;
	}
	
	
	

}
