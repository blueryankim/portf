package circle.gethomecontent.dao;

import java.util.Date;
import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import circle.gethomecontent.model.CommentCountVO;
import circle.gethomecontent.model.GetCommentVO;
import circle.gethomecontent.model.LoginerInformationVO;
import circle.gethomecontent.model.TimelineContentVO;

public class GetHomeContentDaoImpl extends SqlMapClientDaoSupport implements GetHomeContentDao {

	@Override
	public String getTimeArr(String id) {
		
		return  (String)getSqlMapClientTemplate().queryForObject(
				"gethomecontentSql.getTimeArr",id);
	}

	@Override
	public int getTimelineCount(String id) {
		
		return ((Integer)(getSqlMapClientTemplate().queryForObject("gethomecontentSql.getTimelineCount",id))).intValue();
	}

	@Override
	public Date getPopularTime(String id) {
		
		return (Date) getSqlMapClientTemplate().queryForObject("gethomecontentSql.getPopularTime",id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TimelineContentVO> getPopTimelineList(Object obj) {
		
		
		return getSqlMapClientTemplate().queryForList("gethomecontentSql.getPopTimelineList", obj);
	}

	@Override
	public Date getLatestTime(String id) {
		
		return (Date)getSqlMapClientTemplate().queryForObject("gethomecontentSql.getLatestTime",id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TimelineContentVO> getLatTimelineList(Object obj) {
		
		return getSqlMapClientTemplate().queryForList("gethomecontentSql.getLatTimelineList", obj);
		
	}

	@Override
	public LoginerInformationVO getLoginerInformation(String id) {
		
		return (LoginerInformationVO)getSqlMapClientTemplate().queryForObject("gethomecontentSql.getLoginerInformation",id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GetCommentVO> getPopCommentList(Object obj) {
	
		return getSqlMapClientTemplate().queryForList("gethomecontentSql.getPopCommentList", obj);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GetCommentVO> getLatCommentList(Object obj) {
		
		return getSqlMapClientTemplate().queryForList("gethomecontentSql.getLatCommentList", obj);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CommentCountVO> getPopCommentCountList(Object obj) {
		return getSqlMapClientTemplate().queryForList("gethomecontentSql.getPopCommentCountList", obj);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CommentCountVO> getLatCommentCountList(Object obj) {
		return getSqlMapClientTemplate().queryForList("gethomecontentSql.getLatCommentCountList", obj);

	}

	@Override
	public void setCommentCount(Object obj) {
		getSqlMapClientTemplate().update("gethomecontentSql.setCommentCount", obj);

		
	}

	@Override
	public Date getLatestCommentTime(String id) {
		return (Date)getSqlMapClientTemplate().queryForObject("gethomecontentSql.getLatestCommentTime",id);
	}
	
	
	
	
	
}
