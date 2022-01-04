package hooray.getproject.service;

import java.util.Date;
import java.util.List;

import hooray.getproject.model.GetProjectVO;

public interface GetProjectsService {

	public List<GetProjectVO> getProjects(Object obj);
	public Date getLatestDate();
	public List<GetProjectVO> getKindProjects(Object obj);
	public List<GetProjectVO> getSelectProjects(Object obj);

}
