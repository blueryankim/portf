package hooray.getapplicant.dao;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import hooray.getapplicant.model.GetApplicantVO;

public class GetApplicantDaoImpl extends SqlMapClientDaoSupport implements GetApplicantDao{

	@SuppressWarnings("unchecked")
	@Override
	public List<GetApplicantVO> getApplicantList(int projectNum) {
		
		return getSqlMapClientTemplate().queryForList("getApplicantSql.getApplicantList",projectNum);
	}

	@Override
	public int getApplicantCount(int projectNum) {
		// TODO Auto-generated method stub
		return ((Integer)getSqlMapClientTemplate().queryForObject("getApplicantSql.getApplicantCount",projectNum)).intValue();
	}

	@Override
	public int getMemberProjectCount(String email) {
		// TODO Auto-generated method stub
		return ((Integer)getSqlMapClientTemplate().queryForObject("getApplicantSql.getMemberProjectCount",email)).intValue();

	}

}
