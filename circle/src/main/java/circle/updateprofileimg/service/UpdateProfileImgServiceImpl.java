package circle.updateprofileimg.service;

import circle.updateprofileimg.dao.UpdateProfileImgDao;

public class UpdateProfileImgServiceImpl implements UpdateProfileImgService {

	private UpdateProfileImgDao upid;
	
	@Override
	public void updateProfileImg(Object object) {
		
		upid.updateProfileImg(object);
		
	}
	
	@Override
	public String getLatestImageNum(String id) {
		
		return upid.getLatestImageNum(id);
	}
	

	@Override
	public void insertImageInfor(Object object) {
		upid.insertImageInfor(object);
	}


	public void setUpid(UpdateProfileImgDao upid) {
		this.upid = upid;
	}

	

	
	
	
}
