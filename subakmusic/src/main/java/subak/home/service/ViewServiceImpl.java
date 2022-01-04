package subak.home.service;

import java.util.List;

import subak.chart.dao.ChartDao;
import subak.chart.model.ChartVO;

public class ViewServiceImpl implements ViewService {

	/**
	 * @uml.property  name="chartDao"
	 * @uml.associationEnd  
	 */
	public ChartDao chartDao;
	
	/**
	 * @param chartDao
	 * @uml.property  name="chartDao"
	 */
	public void setChartDao(ChartDao chartDao) {
		this.chartDao = chartDao;
	}
	
	@Override
	public List<ChartVO> getChartVOs(Object object) {
		return chartDao.getList(object);
	}
	

}
