package subak.uprecommendation.service;

import subak.uprecommendation.dao.UpRecommendationDao;

public class UpRecommendationServiceImpl implements UpRecommendationService{

	/**
	 * @uml.property  name="uprecommendationdao"
	 * @uml.associationEnd  
	 */
	private UpRecommendationDao uprecommendationdao;
	@Override
	public void upRecommendation(int listnum) {
		
		uprecommendationdao.upRecommendation(listnum);
	}
	
	@Override
	public int getRecomCount(int listnum) {
		
		return uprecommendationdao.getRecomCount(listnum);
	}
	
	/**
	 * @return
	 * @uml.property  name="uprecommendationdao"
	 */
	public UpRecommendationDao getUprecommendationdao() {
		return uprecommendationdao;
	}
	/**
	 * @param uprecommendationdao
	 * @uml.property  name="uprecommendationdao"
	 */
	public void setUprecommendationdao(UpRecommendationDao uprecommendationdao) {
		this.uprecommendationdao = uprecommendationdao;
	}
	

	
}
