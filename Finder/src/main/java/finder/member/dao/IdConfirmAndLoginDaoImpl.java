package finder.member.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import finder.member.model.IdConfirmAndLoginVO;

public class IdConfirmAndLoginDaoImpl  extends SqlMapClientDaoSupport implements IdConfirmAndLoginDao{

	@Override
	public int idExistConfirm(String loginId) {
		
		return ((Integer) getSqlMapClientTemplate().queryForObject(
				"idconfirmandloginSql.idConfirm",loginId)).intValue();
	}

	@Override
	public int inputConfirm(IdConfirmAndLoginVO icalVO) {
		
		return ((Integer) getSqlMapClientTemplate().queryForObject(
				"idconfirmandloginSql.inputConfirm",icalVO)).intValue();
	}

	@Override
	public String getTimelineArr(String id) {
		
		return (String) getSqlMapClientTemplate().queryForObject("idconfirmandloginSql.getTimelineArr",id);
	}
	
	
	

}
