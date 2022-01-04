package circle.inputtimeline.service;

import java.util.List;

import circle.inputtimeline.model.InputTimelineVO;
import circle.inputtimeline.model.TimelineContentVO;

public interface InputTimelineService {

	public void insertTimeline(InputTimelineVO itvo);
	public List<TimelineContentVO> getUpdateTimeline(Object object);
	public String getLatestImageNum(String id);
	public void insertImageInfor(Object obj);
}
