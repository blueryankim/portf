package hooray.project.service;

import hooray.project.dao.PlusCountDao;

public class PlusCountServiceImpl implements PlusCountService {

	private PlusCountDao plusCountDao;
	@Override
	public void plusCount(int projectNum) {
		plusCountDao.plusCount(projectNum);
		
	}
	public PlusCountDao getPlusCountDao() {
		return plusCountDao;
	}
	public void setPlusCountDao(PlusCountDao plusCountDao) {
		this.plusCountDao = plusCountDao;
	}
	
	

}
