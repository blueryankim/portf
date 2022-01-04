package subak.home.service;

import java.util.List;

import subak.chart.model.ChartVO;

public interface ViewService {
	List<ChartVO> getChartVOs(Object object);
}
