package subak.chart.service;

import java.util.List;

import subak.chart.dao.ChartDao;
import subak.chart.model.ChartVO;

public class ChartListServiceImpl implements ChartListService {

	/**
	 * @uml.property  name="chartdao"
	 * @uml.associationEnd  
	 */
	private ChartDao chartdao;

	public List<ChartVO> getChartList(Object obj) {

		return chartdao.getList(obj);
	}
	
	@Override
	public int getChartCount(Object obj) {
		// TODO Auto-generated method stub
		return chartdao.getChartCount(obj);
	}

	
	/**
	 * @return
	 * @uml.property  name="chartdao"
	 */
	public ChartDao getChartdao() {
		return chartdao;
	}

	/**
	 * @param chartdao
	 * @uml.property  name="chartdao"
	 */
	public void setChartdao(ChartDao chartdao) {
		this.chartdao = chartdao;
	}
	


}
