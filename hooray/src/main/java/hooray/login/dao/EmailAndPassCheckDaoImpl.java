package hooray.login.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class EmailAndPassCheckDaoImpl extends SqlMapClientDaoSupport implements EmailAndPassCheckDao {

	@Override
	public String emailAndPassCheck(Object obj) {
		// TODO Auto-generated method stub
		//�̸��� �׸��� �н����� �Ѵ� üũ
		return (String) getSqlMapClientTemplate().queryForObject("emailAndPassCheckSql.emailAndPassCheck",obj);
	}
		//�����ϴ� �̸������� Ȯ��
	@Override
	public int emailCheck(String email) {
		return ((Integer) getSqlMapClientTemplate().queryForObject(
				"emailAndPassCheckSql.emailCheck",email)).intValue();
	}

	
}
