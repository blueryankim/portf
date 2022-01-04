package hooray.joinmember.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import hooray.joinmember.model.JoinMemberVO;

public class JoinMemberDaoImpl extends SqlMapClientDaoSupport implements JoinMemberDao {

	@Override
	public void insertMember(JoinMemberVO joinMemberVO) {
		getSqlMapClientTemplate().insert("insertMemberSql.insertMember",joinMemberVO);
		
	}

	@Override
	public int confirmJoined(String email) {
		
		return ((Integer) getSqlMapClientTemplate().queryForObject(
				"insertMemberSql.confirmJoined",email)).intValue();
	}

	@Override
	public void makeMemberTable(String email) {
		getSqlMapClientTemplate().insert("insertMemberSql.makeMemberTable",email);

		
	}
	}
	
	

	

