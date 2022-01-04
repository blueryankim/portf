package subak.home.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.home.model.MemberVO;

public class LoginDAOImpl extends SqlMapClientDaoSupport implements LoginDAO {

	@Override
	public String getPass(String id) {
		return (String) getSqlMapClientTemplate().queryForObject("loginSql.getPass",id);
	}

	@Override
	public MemberVO getMemberInfo(String id) {
		return (MemberVO) getSqlMapClientTemplate().queryForObject("loginSql.getMemberInfo",id);
	}

}
