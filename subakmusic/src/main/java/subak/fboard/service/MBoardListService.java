package subak.fboard.service;

import java.util.List;

import subak.fboard.model.FBoardVO;
import subak.nboard.model.BoardVO;


public interface MBoardListService {
	Integer getListCount(Object obj);

	List<BoardVO> getBoardList(Object obj);
	
}
