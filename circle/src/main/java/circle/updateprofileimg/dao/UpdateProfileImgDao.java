package circle.updateprofileimg.dao;

public interface UpdateProfileImgDao {

	public void updateProfileImg(Object obj);
	public String getLatestImageNum(String id);
	public void insertImageInfor(Object obj);
}
