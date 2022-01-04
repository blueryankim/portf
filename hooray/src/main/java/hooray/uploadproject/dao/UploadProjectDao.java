package hooray.uploadproject.dao;

import hooray.uploadproject.model.UploadProjectVO;

public interface UploadProjectDao {
	
	public int confirmProjcet(int projectNum);
	public void insertProject(UploadProjectVO uploadProjectVO);
	public void updateProject(UploadProjectVO uploadProjectVO);

}
