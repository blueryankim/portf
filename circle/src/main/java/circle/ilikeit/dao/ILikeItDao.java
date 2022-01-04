package circle.ilikeit.dao;

import java.util.List;

import circle.ilikeit.model.ILikeItVO;

public interface ILikeItDao {

	
	public List<ILikeItVO> getLikingList(int timelinenum);
	public void setLikingInfor(ILikeItVO ilv);
	public String getName(String id);
}
