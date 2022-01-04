package subak.fboard.service;

import java.util.List;

import subak.fboard.model.FBoardVO;


public interface FBoardListService {
	Integer getListCount(Object obj);

	List<FBoardVO> getBoardList(Object obj);
}
