package subak.chart.service;

import java.util.List;

import subak.chart.model.ChartVO;

public interface ChartListService {

	List<ChartVO> getChartList(Object obj);
	public int getChartCount(Object obj);
}
