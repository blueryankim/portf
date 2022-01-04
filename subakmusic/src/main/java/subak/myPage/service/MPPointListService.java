package subak.myPage.service;

import java.util.List;
import subak.myPage.model.PointVO;

public interface MPPointListService {
	Integer getHavingPoint(Object obj);
	Integer getPointListCount(Object obj);
	List<PointVO> getPointList(Object obj);
}