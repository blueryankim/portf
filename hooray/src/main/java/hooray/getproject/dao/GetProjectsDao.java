package hooray.getproject.dao;

import java.util.Date;
import java.util.List;

import hooray.getproject.model.GetProjectVO;

public interface GetProjectsDao {

	public List<GetProjectVO> getProjects(Object model);
	public Date getLatestDate();
	public void updateTempTable(Object model);
	public List<GetProjectVO> getKindProjects(Object obj);
	public List<GetProjectVO> getSelectProjects(Object obj);
}
