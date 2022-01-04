package subak.pointaccumulation.service;

import subak.pointaccumulation.dao.PointAccumulationDao;
import subak.pointaccumulation.model.PointAccumulationVO;

public class PointAccumulationServiceImpl implements PointAccumulationService{

	private PointAccumulationDao pointaccumulation;
	@Override
	public void pointAccumulation(PointAccumulationVO pointaccumulationvo) {
		pointaccumulation.pointAccumulation(pointaccumulationvo);
	}
	

	@Override
	public int getMyPoint(String id) {
		
		return pointaccumulation.getMyPoint(id);
	}
	
	public PointAccumulationDao getPointaccumulation() {
		return pointaccumulation;
	}
	public void setPointaccumulation(PointAccumulationDao pointaccumulation) {
		this.pointaccumulation = pointaccumulation;
	}


	
	

}
