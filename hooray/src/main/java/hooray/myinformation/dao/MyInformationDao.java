package hooray.myinformation.dao;

import java.util.List;

import hooray.myinformation.model.MyInformationVO;
import hooray.myinformation.model.ProjectVO;

public interface MyInformationDao {
	
	public MyInformationVO getMyInformation(String email);
	public Object getMyProjectCount(String email);
	public List<ProjectVO> getMyProjectList(Object obj);
	public List<ProjectVO> getAppProjectList(Object obj);
	public List<ProjectVO> getEndProjectList(Object obj);
	public List<ProjectVO> refreshList(Object obj,String email);

}
