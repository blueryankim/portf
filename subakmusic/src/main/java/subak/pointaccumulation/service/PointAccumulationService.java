package subak.pointaccumulation.service;

import subak.pointaccumulation.model.PointAccumulationVO;

public interface PointAccumulationService {

	public void pointAccumulation(PointAccumulationVO pointaccumulationvo);
	public int getMyPoint(String id);
}
