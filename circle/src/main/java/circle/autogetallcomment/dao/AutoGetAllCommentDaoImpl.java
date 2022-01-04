package circle.autogetallcomment.dao;

import java.util.Date;
import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import circle.autogetallcomment.model.AutoGetAllCommentVO;
import circle.autogetallcomment.model.GetCommentCountVO;

public class AutoGetAllCommentDaoImpl extends SqlMapClientDaoSupport implements AutoGetAllCommentDao{

	@SuppressWarnings("unchecked")
	@Override
	public List<GetCommentCountVO> getCommentCount(String id) {
	
		return getSqlMapClientTemplate().queryForList("autogetallcommentSql.getCommentCount",id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AutoGetAllCommentVO> getCommentList(Object obj) {

		return  getSqlMapClientTemplate().queryForList("autogetallcommentSql.getCommentList",obj);
	}

	@Override
	public void upCommentCount(int gulnum) {
		getSqlMapClientTemplate().update("autogetallcommentSql.upCommentCount",gulnum);
		
	}

	@Override
	public Date getEndCommentTime(String id) {
		
		return (Date)getSqlMapClientTemplate().queryForObject("autogetallcommentSql.getEndCommentTime",id);
	}
	
	

}
