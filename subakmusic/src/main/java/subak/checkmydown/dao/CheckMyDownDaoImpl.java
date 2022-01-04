package subak.checkmydown.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.checkmydown.model.CheckMyDownVO;

public class CheckMyDownDaoImpl extends SqlMapClientDaoSupport implements CheckMyDownDao{

	@Override
	public CheckMyDownVO checkMyDown(CheckMyDownVO checkmydownvo) {
		
		return (CheckMyDownVO)getSqlMapClientTemplate().queryForObject("checkmydownSql.checkMyDown",checkmydownvo);
	}

	
}
