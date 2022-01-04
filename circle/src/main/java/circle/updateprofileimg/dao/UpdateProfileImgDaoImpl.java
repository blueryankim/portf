package circle.updateprofileimg.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class UpdateProfileImgDaoImpl extends SqlMapClientDaoSupport implements UpdateProfileImgDao{

	@Override
	public void updateProfileImg(Object obj) {
		
		getSqlMapClientTemplate().update(
				"updateprofileimgSql.updateProfileImg",obj);
		
	}

	@Override
	public String getLatestImageNum(String id) {
		
		return (String)getSqlMapClientTemplate().queryForObject(
				"updateprofileimgSql.getLatestImageNum",id);
		
	}

	@Override
	public void insertImageInfor(Object obj) {
		getSqlMapClientTemplate().insert(
				"updateprofileimgSql.insertImageInfor",obj);
		
	}
	
	
	
	
	
	
	

}
