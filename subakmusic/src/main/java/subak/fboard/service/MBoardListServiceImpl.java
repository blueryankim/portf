package subak.fboard.service;

import java.util.List;

import subak.fboard.dao.FBoardDao;
import subak.fboard.model.FBoardVO;
import subak.nboard.dao.BoardDao;
import subak.nboard.model.BoardVO;
import subak.nboard.service.BoardListService;


public class MBoardListServiceImpl implements BoardListService {
	/**
	 * @uml.property  name="boardDao"
	 * @uml.associationEnd  
	 */
	private BoardDao boardDao;

	/**
	 * @param boardDao
	 * @uml.property  name="boardDao"
	 */
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public List<BoardVO> getBoardList(Object obj) {
		return this.boardDao.getList(obj);
	}

	@Override
	public Integer getListCount(Object obj) {
		return this.boardDao.getListCount(obj);
		
	}
}