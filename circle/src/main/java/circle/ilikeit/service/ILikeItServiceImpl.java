package circle.ilikeit.service;

import java.util.List;

import circle.ilikeit.dao.ILikeItDao;
import circle.ilikeit.model.ILikeItVO;

public class ILikeItServiceImpl implements ILikeItService{

	private ILikeItDao ild;
	@Override
	public List<ILikeItVO> getLikingList(int timelinenum) {
		
		return ild.getLikingList(timelinenum);
	}
	public void setIld(ILikeItDao ild) {
		this.ild = ild;
	}
	@Override
	public void setLikingInfor(ILikeItVO ilv) {
		ild.setLikingInfor(ilv);
		
	}
	@Override
	public String getName(String id) {
		return ild.getName(id);
	}
	
	

}
