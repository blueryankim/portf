package hooray.uploadproject.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import hooray.uploadproject.model.UploadProjectVO;

public class UploadProjectDaoImpl extends SqlMapClientDaoSupport implements UploadProjectDao{

	@Override
	public int confirmProjcet(int projectNum) {
		
		return ((Integer) getSqlMapClientTemplate().queryForObject(
				"uploadProjectSql.confirmProject",projectNum)).intValue();
	}

	@Override
	public void insertProject(UploadProjectVO uploadProjectVO) {
		getSqlMapClientTemplate().insert("uploadProjectSql.insertProject",uploadProjectVO);
		getSqlMapClientTemplate().insert("uploadProjectSql.applyProject",uploadProjectVO);
		getSqlMapClientTemplate().insert("uploadProjectSql.insertChatting",uploadProjectVO);

		
	}

	@Override
	public void updateProject(UploadProjectVO uploadProjectVO) {
		getSqlMapClientTemplate().update("uploadProjectSql.updateProject",uploadProjectVO);
		
	}

	
}
