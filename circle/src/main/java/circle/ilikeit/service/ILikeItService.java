package circle.ilikeit.service;

import java.util.List;

import circle.ilikeit.model.ILikeItVO;

public interface ILikeItService {
	
	public List<ILikeItVO> getLikingList(int timelinenum);
	public void setLikingInfor(ILikeItVO ilv);
	public String getName(String id);
	

}
