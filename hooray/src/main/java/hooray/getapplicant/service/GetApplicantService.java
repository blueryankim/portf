package hooray.getapplicant.service;

import java.util.List;

import hooray.getapplicant.model.GetApplicantVO;

public interface GetApplicantService {
	
	public List<GetApplicantVO> getApplicantList(int projectNum);
	public int getApplicantCount(int projectNum);
	public int getMemberProjectCount(String email);

}
