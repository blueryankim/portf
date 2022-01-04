package hooray.uploadproject.service;

import hooray.uploadproject.model.UploadProjectVO;

public interface UploadProjectService {
	
	public int insertProject(UploadProjectVO uploadProjectVO);
	public int updateProject(UploadProjectVO uploadProjectVO);

}
