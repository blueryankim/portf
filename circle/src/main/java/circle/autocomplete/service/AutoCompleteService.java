package circle.autocomplete.service;

import java.util.List;

import circle.autocomplete.model.AutoCompleteVO;

public interface AutoCompleteService {

	public List<AutoCompleteVO> autoComplete(String query);
}
