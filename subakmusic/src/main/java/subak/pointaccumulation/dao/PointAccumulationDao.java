package subak.pointaccumulation.dao;

import subak.pointaccumulation.model.PointAccumulationVO;

public interface PointAccumulationDao {

	public void pointAccumulation(PointAccumulationVO pointaccumulationvo);
	public int getMyPoint(String id);
}
