package circle.inputtimeline.service;

import java.util.List;

import circle.inputtimeline.dao.InputTimelineDao;
import circle.inputtimeline.model.InputTimelineVO;
import circle.inputtimeline.model.TimelineContentVO;

public class InputTimelineServiceImpl implements InputTimelineService {
	
	private InputTimelineDao ipd; 
	@Override
	public void insertTimeline(InputTimelineVO itvo) {
		ipd.insertTimeline(itvo);
		
	}
	
	@Override
	public List<TimelineContentVO> getUpdateTimeline(Object object) {
		return ipd.getUpdateTimeline(object);
	}
	
	
	@Override
	public String getLatestImageNum(String id) {
		
		return ipd.getLatestImageNum(id);
	}

	@Override
	public void insertImageInfor(Object obj) {
		ipd.insertImageInfor(obj);
	}

	
	
	public void setIpd(InputTimelineDao ipd) {
		this.ipd = ipd;
	}



	
}
