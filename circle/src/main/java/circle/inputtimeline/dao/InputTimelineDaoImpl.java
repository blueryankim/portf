package circle.inputtimeline.dao;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import circle.inputtimeline.model.InputTimelineVO;
import circle.inputtimeline.model.TimelineContentVO;

public class InputTimelineDaoImpl extends SqlMapClientDaoSupport implements InputTimelineDao{

	@Override
	public void insertTimeline(InputTimelineVO itvo) {
		
		if(itvo.getTowhom()==null || itvo.getTowhom()==""){
		getSqlMapClientTemplate().insert("inputtimelineSql.insertTimeline", itvo);
		}
	
		else{
		getSqlMapClientTemplate().insert("inputtimelineSql.insertTimeline2", itvo);
				
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TimelineContentVO> getUpdateTimeline(Object object) {
		
		Map<String,Object> map=(Map<String,Object>)object;
		String kindoftimeline=(String)map.get("kindoftimeline");
		
		if(kindoftimeline=="popular" || kindoftimeline.equals("popular")){
		return 	getSqlMapClientTemplate().queryForList("inputtimelineSql.getUpdatedTimelineList", object);
		}
		
		else{
		return 	getSqlMapClientTemplate().queryForList("inputtimelineSql.getUpdatedTimelineList", object);
				
		}
	}

	@Override
	public String getLatestImageNum(String id) {
		
		return (String)getSqlMapClientTemplate().queryForObject("inputtimelineSql.getLatestImageNum",id);
	}

	@Override
	public void insertImageInfor(Object obj) {
		getSqlMapClientTemplate().insert("inputtimelineSql.insertImageInfor",obj);
		
	}

	
	

	
	
}
