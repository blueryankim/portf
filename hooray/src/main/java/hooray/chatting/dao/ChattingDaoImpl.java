package hooray.chatting.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import hooray.chatting.model.ChattingVO;

public class ChattingDaoImpl extends SqlMapClientDaoSupport implements ChattingDao {

	@Override
	public Date getAppDate(Object obj) {
		
		return (Date) getSqlMapClientTemplate().queryForObject("chattingSql.getAppDate",obj);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ChattingVO> getChattingList(Object obj) {
	
		Map<String,Object> map=new HashMap<String,Object>();
		map=(Map<String,Object>)obj;
		//처음에 실행되는 부분
		if(map.size()==5){
		getSqlMapClientTemplate().update("chattingSql.updateChattingInPeople",obj);
		return getSqlMapClientTemplate().queryForList("chattingSql.getChattingList",obj);
		
		}
		//Ajax로 실행되는 부분
		else{
		return getSqlMapClientTemplate().queryForList("chattingSql.getChattingListAjax",obj);
	
		}
		}

	@SuppressWarnings("unchecked")
	@Override
	public int getUnreadCount(Object obj) {
		Map<String,Object> map=new HashMap<String,Object>();
		map=(Map<String,Object>)obj;
		
		Date chattingLogDate;
		chattingLogDate=(Date) getSqlMapClientTemplate().queryForObject("chattingSql.getChattingLogDate",obj);
		map.put("chattingLogDate", chattingLogDate);
		
		return ((Integer)getSqlMapClientTemplate().queryForObject("chattingSql.getUnreadChaCount",map)).intValue();
	}

	@Override
	public String getProjectOwner(int projectNum) {
	
		return (String)getSqlMapClientTemplate().queryForObject("chattingSql.getProjectOwner",projectNum);

	}

	@Override
	public void uploadChattingMessage(ChattingVO chattingVO) {
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("pnum", chattingVO.getPnum());
		map.put("email", chattingVO.getEmail());
		getSqlMapClientTemplate().insert("chattingSql.uploadChattingMessage",chattingVO);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ChattingVO> bringOldMessage(Object obj) {
		// TODO Auto-generated method stub
		return getSqlMapClientTemplate().queryForList("chattingSql.getOldMessageListAjax",obj);
	}

	@Override
	public void updateLogDate(Object obj) {

		getSqlMapClientTemplate().update("chattingSql.updateLogDate",obj);
		getSqlMapClientTemplate().update("chattingSql.updateChattingOutPeople",obj);
	}

	@Override
	public int getChattingPeopleCount(int projectNum) {
		
		return ((Integer)getSqlMapClientTemplate().queryForObject("chattingSql.getChattingPeopleCount",projectNum)).intValue();
	}

}
