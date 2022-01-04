package hooray.getcomment.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import hooray.getcomment.model.GetCommentVO;

public class GetCommentDaoImpl extends SqlMapClientDaoSupport implements GetCommentDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<GetCommentVO> getAllComment(Object obj) {
	
		return getSqlMapClientTemplate().queryForList("getCommentSql.getAllComment",obj);
	}

	@Override
	public int getCommentCount(int projectNum) {

		return ((Integer)getSqlMapClientTemplate().queryForObject("getCommentSql.getCommentCount",projectNum)).intValue();
	}

	@Override
	public void uploadComment(GetCommentVO getCommentVO) {
			getSqlMapClientTemplate().insert("getCommentSql.uploadComment",getCommentVO);
		
	}

	@Override
	public Date getLastCommentDate(Object obj) {
		
		return (Date)getSqlMapClientTemplate().queryForObject("getCommentSql.getLastCommentDate",obj);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GetCommentVO> getCommentList(Object obj) {
		
		Map<String,Object> map=new HashMap<String,Object>();
		map=(Map<String,Object>)obj;
		
		String flag=(String)map.get("flag");
		
		//내가 입력한 댓글이 최신시간인 경우
		if(flag=="1" || flag.equals("1") && map.size()==3){

	
			return getSqlMapClientTemplate().queryForList("getCommentSql.getCommentListFirst",obj);
		
		//내가 입력한 댓글이 최신시간이 아닌 경우
		}
		
		else{

		return getSqlMapClientTemplate().queryForList("getCommentSql.getCommentList",obj);	
		}
		
		}

	@Override
	public void updateComment(Object obj) {
			getSqlMapClientTemplate().update("getCommentSql.updateComment",obj);
		
	}

	@Override
	public void deleteComment(int commentNum) {
	
		getSqlMapClientTemplate().delete("getCommentSql.deleteComment",commentNum);

	}
	

}
	

