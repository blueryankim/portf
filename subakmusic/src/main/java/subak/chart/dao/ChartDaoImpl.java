package subak.chart.dao;

//노래등록하기 
//재생,다운에 따른 카운트 올려주기
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.chart.model.ChartVO;

public class ChartDaoImpl extends SqlMapClientDaoSupport implements ChartDao {

	@SuppressWarnings("unchecked")
	@Override
	public int getChartCount(Object obj) {

		Map<String, Object> map = new HashMap<String, Object>();
		map = (Map<String, Object>) obj;
		if (map.get("search_type").equals("ppopular")||map.get("search_type").equals("dpopular")||map.get("search_type").equals("latest")) {
			return ((Integer) getSqlMapClientTemplate().queryForObject(
					"chartSql.getChartCount")).intValue();
			// 재생인기차트리스트 가져오기
		}

		else if (map.get("search_type").equals("gayochart")){
			return ((Integer) getSqlMapClientTemplate().queryForObject(
					"chartSql.getGayoChartCount")).intValue();
		}

		else {
			return((Integer) getSqlMapClientTemplate().queryForObject(
					"chartSql.getPopChartCount")).intValue();
			
		}

	}

	
	@SuppressWarnings("unchecked")
	@Override
	// obj를 그대로 가지고 들어가서 ibatis 연산을 시작.
	public List<ChartVO> getList(Object obj) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = (Map<String, Object>) obj;
		if (map.get("search_type").equals("ppopular")) {
			return getSqlMapClientTemplate().queryForList(
					"chartSql.getPPopularList", obj);
			// 재생인기차트리스트 가져오기
		}

		else if (map.get("search_type").equals("dpopular")) {
			return getSqlMapClientTemplate().queryForList(
					"chartSql.getDPopularList", obj);
			// 다운로드인기차트리스트 가져오기
		}
		
		else if (map.get("search_type").equals("popsongchart")){
			return getSqlMapClientTemplate().queryForList("chartSql.getPopList",obj);
		}
		
		else if (map.get("search_type").equals("gayochart")){
			return getSqlMapClientTemplate().queryForList("chartSql.getGayoList",obj);
		}

		else {
			return getSqlMapClientTemplate().queryForList(
					"chartSql.getLatestList", obj);
			// 최신차트리스트 가져오기
		}

	}

}