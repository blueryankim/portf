package subak.help.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class HelpDAOImpl extends SqlMapClientDaoSupport implements HelpDAO {

	@Override
	public String getEmail(String name) {
		return (String) getSqlMapClientTemplate().queryForObject("helpSql.getEmail",name);
	}

	@Override
	public String getId(String email) {
		return (String) getSqlMapClientTemplate().queryForObject("helpSql.getId",email);
	}

	@Override
	public String getPass(String id) {
		return (String) getSqlMapClientTemplate().queryForObject("helpSql.getPass", id);
	}
	

}
