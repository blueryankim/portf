package hooray.getproject.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import hooray.getproject.model.GetProjectVO;

public class GetAProjectDaoImpl extends SqlMapClientDaoSupport implements GetAProjectDao {

	@Override
	public GetProjectVO getAProject(int projectNum) {
		// TODO Auto-generated method stub
		return ((GetProjectVO)getSqlMapClientTemplate().queryForObject(
				"getProjectSql.getAProject",projectNum));
		

	}

}
