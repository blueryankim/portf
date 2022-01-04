package hooray.login.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class EmailAndPassCheckDaoImpl extends SqlMapClientDaoSupport implements EmailAndPassCheckDao {

	@Override
	public String emailAndPassCheck(Object obj) {
		// TODO Auto-generated method stub
		//이메일 그리고 패스워드 둘다 체크
		return (String) getSqlMapClientTemplate().queryForObject("emailAndPassCheckSql.emailAndPassCheck",obj);
	}
		//존재하는 이메일인지 확인
	@Override
	public int emailCheck(String email) {
		return ((Integer) getSqlMapClientTemplate().queryForObject(
				"emailAndPassCheckSql.emailCheck",email)).intValue();
	}

	
}
