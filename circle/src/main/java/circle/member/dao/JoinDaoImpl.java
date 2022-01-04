package circle.member.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import circle.member.model.JoinVO;

public class JoinDaoImpl extends SqlMapClientDaoSupport implements JoinDao {

	@Override
	public void insertMember(JoinVO joinVO) {
		getSqlMapClientTemplate().insert(
				"joinmemberSql.insertMember",joinVO);
		
	}
	
	

}
