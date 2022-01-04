package circle.inputcomment.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class InputCommentDaoImpl extends SqlMapClientDaoSupport implements InputCommentDao{

	@Override
	public void insertComment(Object obj) {
		
		getSqlMapClientTemplate().insert("inputcommentSql.insertComment", obj);

		
	}

	@Override
	public void updateTimelineDate(int gulnum) {
		getSqlMapClientTemplate().update("inputcommentSql.updateTimelineDate", gulnum);

		
	}
	
	

}
