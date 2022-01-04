package circle.autocomplete.service;

import java.util.List;

import circle.autocomplete.dao.AutoCompleteDao;
import circle.autocomplete.model.AutoCompleteVO;

public class AutoCompleteServiceImpl implements AutoCompleteService{

	private AutoCompleteDao acd;
	
	@Override
	public List<AutoCompleteVO> autoComplete(String query) {
		
		return acd.autoComplete(query);
	}

	public void setAcd(AutoCompleteDao acd) {
		this.acd = acd;
	}
	
	
	

}
