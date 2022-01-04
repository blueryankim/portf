package subak.nboard.service;

import java.util.List;
import subak.nboard.model.BoardVO;

public interface BoardListService {
	Integer getListCount(Object obj);
	List<BoardVO> getBoardList(Object obj);
}