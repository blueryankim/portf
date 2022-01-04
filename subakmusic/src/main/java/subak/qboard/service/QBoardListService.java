package subak.qboard.service;

import java.util.List;

import subak.qboard.model.QBoardVO;


public interface QBoardListService {
	Integer getListCount(Object obj);

	List<QBoardVO> getBoardList(Object obj);
}
