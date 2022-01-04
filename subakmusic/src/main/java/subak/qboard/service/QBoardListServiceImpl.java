package subak.qboard.service;

import java.util.List;

import subak.qboard.dao.QBoardDao;
import subak.qboard.model.QBoardVO;


public class QBoardListServiceImpl implements QBoardListService {
	/**
	 * @uml.property  name="boardDao"
	 * @uml.associationEnd  
	 */
	private QBoardDao boardDao;

	/**
	 * @param boardDao
	 * @uml.property  name="boardDao"
	 */
	public void setBoardDao(QBoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public List<QBoardVO> getBoardList(Object obj) {
		return this.boardDao.getList(obj);
	}

	@Override
	public Integer getListCount(Object obj) {
		return this.boardDao.getListCount(obj);
	}
}