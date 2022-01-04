package circle.member.service;

import java.util.List;

import circle.member.dao.SearchUniversityDao;

public class SearchUniversityServiceImpl implements SearchUniversityService {

	private SearchUniversityDao sud;
	@Override
	public List<String> searchUniversity(String uniname) {
		
		return sud.searchUniversity(uniname);
	}
	
	public void setSud(SearchUniversityDao sud) {
		this.sud = sud;
	}
	
	
	
	

}
