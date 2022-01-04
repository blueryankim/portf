package circle.autocomplete.dao;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import circle.autocomplete.model.AutoCompleteVO;

public class AutoCompleteDaoImpl  extends SqlMapClientDaoSupport implements AutoCompleteDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<AutoCompleteVO> autoComplete(String query) {
		
		return getSqlMapClientTemplate().queryForList(
				"autocompleteSql.getAutoComplete", query);
	}
	

}
