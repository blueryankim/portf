package subak.chart.dao;

//�뷡����ϱ� 
//���,�ٿ ���� ī��Ʈ �÷��ֱ�
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
			// ����α���Ʈ����Ʈ ��������
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
	// obj�� �״�� ������ ���� ibatis ������ ����.
	public List<ChartVO> getList(Object obj) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = (Map<String, Object>) obj;
		if (map.get("search_type").equals("ppopular")) {
			return getSqlMapClientTemplate().queryForList(
					"chartSql.getPPopularList", obj);
			// ����α���Ʈ����Ʈ ��������
		}

		else if (map.get("search_type").equals("dpopular")) {
			return getSqlMapClientTemplate().queryForList(
					"chartSql.getDPopularList", obj);
			// �ٿ�ε��α���Ʈ����Ʈ ��������
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
			// �ֽ���Ʈ����Ʈ ��������
		}

	}

}