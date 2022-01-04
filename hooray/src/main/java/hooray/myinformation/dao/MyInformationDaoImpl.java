package hooray.myinformation.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import hooray.myinformation.model.MyInformationVO;
import hooray.myinformation.model.ProjectVO;

public class MyInformationDaoImpl extends SqlMapClientDaoSupport implements MyInformationDao{

	@Override
	public MyInformationVO getMyInformation(String email) {
		// TODO Auto-generated method stub
		return (MyInformationVO)getSqlMapClientTemplate().queryForObject("myInformationSql.getMyInformation",email);
	}
	
	public Object getMyProjectCount(String email){
		
		int myProjectCount;
		int appProjectCount;
		int endProjectCount;
		
		myProjectCount=((Integer)getSqlMapClientTemplate().queryForObject("myInformationSql.getMyProjectCount",email)).intValue();
		appProjectCount=((Integer)getSqlMapClientTemplate().queryForObject("myInformationSql.getAppProjectCount",email)).intValue();
		endProjectCount=((Integer)getSqlMapClientTemplate().queryForObject("myInformationSql.getEndProjectCount",email)).intValue();
		
		Map<String,Object>map=new HashMap<String,Object>();
		map.put("myProjectCount", myProjectCount);
		map.put("appProjectCount", appProjectCount);
		map.put("endProjectCount", endProjectCount);
		
		return map;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProjectVO> getMyProjectList(Object obj) {
		
		Date chalogdate;
		String email;
		Map<String,Object> model=new HashMap<String,Object>();
		model=(Map<String,Object>)obj;
		email=(String)model.get("email");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("email", email);

		//project�ѹ��� ���ϰ� �ش� ������Ʈ�� ä�� �����ο��� ���Ѵ�, obj�� ���� email�� ����Ʈ�κ��� project_num�� �����ͼ� chlogdate�� �����ͼ� sysdate���� ���� ���� ä�� �� ���ϱ�  
		List<ProjectVO> list=getSqlMapClientTemplate().queryForList("myInformationSql.getMyProjectList",obj);
	
		
		
		if(list.size()>=1){
		for(int i=0; i<list.size();i++){
			int projectNum=list.get(i).getProjectNum();
			int onChattingPeopleCount=((Integer)getSqlMapClientTemplate().queryForObject("myInformationSql.getOnChattingPeopleCount",projectNum)).intValue();
			list.get(i).setOnchattingpeople(onChattingPeopleCount);
			
			map.put("projectNum",projectNum);
			
			chalogdate=(Date)getSqlMapClientTemplate().queryForObject("myInformationSql.getChattingLogDate",map);
			map.put("chalogdate", chalogdate);
			list.get(i).setUnreadcount(((Integer)getSqlMapClientTemplate().queryForObject("myInformationSql.getUnreadChaCount",map)).intValue());
			
		}
		}
		
		return list;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProjectVO> getAppProjectList(Object obj) {
		
		Date chalogdate;
		String email;
		Map<String,Object> model=new HashMap<String,Object>();
		model=(Map<String,Object>)obj;
		email=(String)model.get("email");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("email", email);

		//project�ѹ��� ���ϰ� �ش� ������Ʈ�� ä�� �����ο��� ���Ѵ�, obj�� ���� email�� ����Ʈ�κ��� project_num�� �����ͼ� chlogdate�� �����ͼ� sysdate���� ���� ���� ä�� �� ���ϱ�  
		List<ProjectVO> list=getSqlMapClientTemplate().queryForList("myInformationSql.getAppProjectList",obj);
	
		
		
		if(list.size()>=1){
		for(int i=0; i<list.size();i++){
			int projectNum=list.get(i).getProjectNum();
			int onChattingPeopleCount=((Integer)getSqlMapClientTemplate().queryForObject("myInformationSql.getOnChattingPeopleCount",projectNum)).intValue();
			list.get(i).setOnchattingpeople(onChattingPeopleCount);
			
			map.put("projectNum",projectNum);
			
			chalogdate=(Date)getSqlMapClientTemplate().queryForObject("myInformationSql.getChattingLogDate",map);
			map.put("chalogdate", chalogdate);
			list.get(i).setUnreadcount(((Integer)getSqlMapClientTemplate().queryForObject("myInformationSql.getUnreadChaCount",map)).intValue());
			
		}
		}
		
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProjectVO> getEndProjectList(Object obj) {

		Date chalogdate;
		String email;
		Map<String,Object> model=new HashMap<String,Object>();
		model=(Map<String,Object>)obj;
		email=(String)model.get("email");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("email", email);

		//project�ѹ��� ���ϰ� �ش� ������Ʈ�� ä�� �����ο��� ���Ѵ�, obj�� ���� email�� ����Ʈ�κ��� project_num�� �����ͼ� chlogdate�� �����ͼ� sysdate���� ���� ���� ä�� �� ���ϱ�  
		List<ProjectVO> list=getSqlMapClientTemplate().queryForList("myInformationSql.getEndProjectList",obj);
	
		
		
		if(list.size()>=1){
		for(int i=0; i<list.size();i++){
			int projectNum=list.get(i).getProjectNum();
			int onChattingPeopleCount=((Integer)getSqlMapClientTemplate().queryForObject("myInformationSql.getOnChattingPeopleCount",projectNum)).intValue();
			list.get(i).setOnchattingpeople(onChattingPeopleCount);
			
			map.put("projectNum",projectNum);
			
			chalogdate=(Date)getSqlMapClientTemplate().queryForObject("myInformationSql.getChattingLogDate",map);
			map.put("chalogdate", chalogdate);
			list.get(i).setUnreadcount(((Integer)getSqlMapClientTemplate().queryForObject("myInformationSql.getUnreadChaCount",map)).intValue());
			
		}
		}
		
		return list;
	}
	//������ ����ߴ� ����Ʈ�� session�� �ִ� ���� �ٽ� �����ͼ� ������ ������Ʈ �ѵ� ��Ʈ�ѷ��� ������ �ϰ� �ִ�.
	@Override
	public List<ProjectVO> refreshList(Object obj,String email) {

		List<ProjectVO> list=updateList(obj,email);
		
		return list;
	}
	
	public List<ProjectVO> updateList(Object obj,String email){
		
	@SuppressWarnings("unchecked")
		List<ProjectVO> list=(List<ProjectVO>)obj;
		Date chalogdate;
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("email", email);
		System.out.println("**************");
		System.out.println(email);
		System.out.println("***************");
		if(list.size()>=1){
			for(int i=0; i<list.size();i++){
				int projectNum=list.get(i).getProjectNum();
				int onChattingPeopleCount=((Integer)getSqlMapClientTemplate().queryForObject("myInformationSql.getOnChattingPeopleCount",projectNum)).intValue();
				list.get(i).setOnchattingpeople(onChattingPeopleCount);
				
				map.put("projectNum",projectNum);
				
				chalogdate=(Date)getSqlMapClientTemplate().queryForObject("myInformationSql.getChattingLogDate",map);
				System.out.println(chalogdate);
				map.put("chalogdate", chalogdate);
				list.get(i).setUnreadcount(((Integer)getSqlMapClientTemplate().queryForObject("myInformationSql.getUnreadChaCount",map)).intValue());
				
			}
	}
	
				return list;
	}
}
