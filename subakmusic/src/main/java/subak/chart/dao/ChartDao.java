package subak.chart.dao;

import java.util.List;

import subak.chart.model.ChartVO;

public interface ChartDao {
	int getChartCount(Object obj);
	List<ChartVO> getList(Object obj);
	
}
