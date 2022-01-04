package finder.postcontent.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import finder.postcontent.model.PostContentVO;

public class PostContentDaoImpl extends SqlMapClientDaoSupport implements PostContentDao{

	@Override
	public void postContent(PostContentVO pcVO) {
		getSqlMapClientTemplate().insert("postcontentSql.insertPostContent",pcVO);
		
	}

	@Override
	public int getImageNum(String id) {
		
		return ((Integer)(getSqlMapClientTemplate().queryForObject("postcontentSql.getImageNum",id))).intValue();
	}

	@Override
	protected void initDao() throws Exception {
		
		super.initDao();
	}
	
	

}
