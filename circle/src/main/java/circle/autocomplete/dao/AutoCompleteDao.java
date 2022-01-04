package circle.autocomplete.dao;

import java.util.List;

import circle.autocomplete.model.AutoCompleteVO;

public interface AutoCompleteDao {

	public List<AutoCompleteVO> autoComplete(String query);
}
