package circle.member.dao;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class SearchUniversityDaoImpl extends  SqlMapClientDaoSupport implements SearchUniversityDao {

	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> searchUniversity(String uniname) {
		return getSqlMapClientTemplate().queryForList(
				"searchuniSql.searchUniversity",uniname);

	}
	
	
	
}

	
