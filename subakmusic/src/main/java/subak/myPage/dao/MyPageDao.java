package subak.myPage.dao;

import java.util.List;
import subak.myPage.model.AlbumVO;
import subak.myPage.model.DownloadListVO;
import subak.myPage.model.MemberVO;
import subak.myPage.model.PointVO;

public interface MyPageDao {
	int getHavingPoint(Object obj);
	int getDownloadCount(Object obj);
	int getMyAlbumCount(Object obj);
	
	int getPointListCount(Object obj);
	List<PointVO> getPointList(Object obj);
	
	List<DownloadListVO> getDownloadList(Object obj);
	
	List<AlbumVO> getAlbumList(Object obj);
	
	MemberVO getMemberInfo(String userID);
	void updateMemberInfo(MemberVO memberVO);
	
	String getPass(String userID);
	void deleteMember(String userID);
}