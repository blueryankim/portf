package finder.member.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import finder.member.model.JoinVO;

public class JoinDaoImpl extends SqlMapClientDaoSupport implements JoinDao {

	public void addMember(JoinVO joinVO){
		getSqlMapClientTemplate().insert("addmemberSql.addMember",joinVO);
		
	}
}
