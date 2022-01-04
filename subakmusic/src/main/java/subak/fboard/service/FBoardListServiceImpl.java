package subak.fboard.service;

import java.util.List;

import subak.fboard.dao.FBoardDao;
import subak.fboard.model.FBoardVO;


public class FBoardListServiceImpl implements FBoardListService {
	/**
	 * @uml.property  name="boardDao"
	 * @uml.associationEnd  
	 */
	private FBoardDao boardDao;

	/**
	 * @param boardDao
	 * @uml.property  name="boardDao"
	 */
	public void setBoardDao(FBoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public List<FBoardVO> getBoardList(Object obj) {
		return this.boardDao.getList(obj);
	}

	@Override
	public Integer getListCount(Object obj) {
		return this.boardDao.getListCount(obj);
	}
}