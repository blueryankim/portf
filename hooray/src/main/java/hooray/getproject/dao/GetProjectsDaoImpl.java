package hooray.getproject.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import hooray.getproject.model.GetProjectVO;

public class GetProjectsDaoImpl extends SqlMapClientDaoSupport implements GetProjectsDao {

	
	public Date getLatestDate(){
		
		return (Date)getSqlMapClientTemplate().queryForObject("getProjectSql.getLatestDate");	
		
	}
	@SuppressWarnings("unchecked")
	@Override
	
	public List<GetProjectVO> getProjects(Object model) {
		
		Map<String,Object> map=new HashMap<String,Object>();
		map=(Map<String,Object>)model;
		
		String search_type=(String)map.get("search_type");
		
		if(search_type=="latest" || search_type.equals("latest")){
		
			if(map.get("flag")=="1"||map.get("flag").equals("1") ){
	
				return getSqlMapClientTemplate().queryForList("getProjectSql.getLatestProjectsList",model);	
		
			}
		 else{
			
			return getSqlMapClientTemplate().queryForList("getProjectSql.getLatestProjectsListAjax",model);	
			
			}
		}
		
		else{

			if(map.get("flag")=="1"||map.get("flag").equals("1")){

				updateTempTable(model);
				return getSqlMapClientTemplate().queryForList("getProjectSql.getPopularProjectsList",model);	
				}
			
		
			
			else{	

			return getSqlMapClientTemplate().queryForList("getProjectSql.getPopularProjectsList",model);	
			
			}
		}
	}
	
	
	@SuppressWarnings("unchecked")
	public List<GetProjectVO> getKindProjects(Object obj){
		
		Map<String,Object> map=new HashMap<String,Object>();
		map=(Map<String,Object>)obj;
		String search_type=(String)map.get("search_type");
		
		if(search_type=="latest" || search_type.equals("latest")){
			
			if(map.get("flag")=="1"||map.get("flag").equals("1") ){
	
			return getSqlMapClientTemplate().queryForList("getProjectSql.getLatestProjectsKindList",map);	
		
			}
		 else{
			
			return getSqlMapClientTemplate().queryForList("getProjectSql.getLatestProjectsKindListAjax",map);	
			
			}
		}
		
		else{

			if(map.get("flag")=="1"||map.get("flag").equals("1")){

				updateTempTableForProjectKind(map);
			}
				return getSqlMapClientTemplate().queryForList("getProjectSql.getPopularProjectsList",map);	
			}
	
		}
	
	

	@SuppressWarnings("unchecked")
	@Override
	public List<GetProjectVO> getSelectProjects(Object obj) {
		Map<String,Object> map=new HashMap<String,Object>();
		map=(Map<String,Object>)obj;
		
		String searchselect=(String)map.get("searchselect");
		if(searchselect=="writer"||searchselect.equals("writer")){
			
			if(map.get("flag")=="1"||map.get("flag").equals("1"))
			return getSqlMapClientTemplate().queryForList("getProjectSql.getWriterProjectsList",obj);	
			else
			return getSqlMapClientTemplate().queryForList("getProjectSql.getWriterProjectsAjaxList",obj);	


		}
		
		else if(searchselect=="title"||searchselect.equals("title")){
			if(map.get("flag")=="1"||map.get("flag").equals("1"))
			return getSqlMapClientTemplate().queryForList("getProjectSql.getTitleProjectsList",obj);
			else
			return getSqlMapClientTemplate().queryForList("getProjectSql.getTitleProjectsAjaxList",obj);	


		}
		
		else{
			if(map.get("flag")=="1"||map.get("flag").equals("1"))
			return getSqlMapClientTemplate().queryForList("getProjectSql.getRegionProjectsList",obj);	
			else
			return getSqlMapClientTemplate().queryForList("getProjectSql.getRegionProjectsAjaxList",obj);	

		}
	
	}
		
	@SuppressWarnings("unchecked")
		public void updateTempTable(Object model){
			Map<String,Object> map=new HashMap<String,Object>();
			map=(Map<String,Object>)model;
		
			getSqlMapClientTemplate().update("getProjectSql.truncateMemberTable",(String)map.get("email"));
			getSqlMapClientTemplate().insert("getProjectSql.insertTempForPopularList",model);
	

	
	}
		
		
		@SuppressWarnings("unchecked")
		public void updateTempTableForProjectKind(Object model){
			Map<String,Object> map=new HashMap<String,Object>();
			map=(Map<String,Object>)model;
		
			getSqlMapClientTemplate().update("getProjectSql.truncateMemberTable",(String)map.get("email"));
			getSqlMapClientTemplate().insert("getProjectSql.insertTempForPopularKindList",model);
	

	
	}
}
