package subak.myPage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import subak.myPage.model.AlbumVO;
import subak.myPage.model.DownloadListVO;
import subak.myPage.model.MemberVO;
import subak.myPage.model.PointVO;

public class MyPageDaoImpl extends SqlMapClientDaoSupport implements MyPageDao {

	/* ���������� : Ȩ */
	@SuppressWarnings("unchecked")
	@Override
	public int getHavingPoint(Object obj) {
		Map<String, Object> map = new HashMap<String, Object>();
			map = (Map<String, Object>) obj;

		return ((Integer) getSqlMapClientTemplate()
				.queryForObject("mypageSql.mp_havingPoint", obj)).intValue();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public int getDownloadCount(Object obj) {
		Map<String, Object> map = new HashMap<String, Object>();
			map = (Map<String, Object>) obj;
		
		return ((Integer) getSqlMapClientTemplate()
				.queryForObject("mypageSql.mp_downloadMusic", obj)).intValue();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public int getMyAlbumCount(Object obj) {
		Map<String, Object> map = new HashMap<String, Object>();
			map = (Map<String, Object>) obj;
		
		return ((Integer) getSqlMapClientTemplate()
				.queryForObject("mypageSql.mp_myAlbum", obj)).intValue();
	}

	
	/* ���������� : ����Ʈ���� */
	@SuppressWarnings("unchecked")
	@Override
	public int getPointListCount(Object obj) {
		Map<String, Object> map = new HashMap<String, Object>();
			map = (Map<String, Object>) obj;
		
		return ((Integer) getSqlMapClientTemplate()
				.queryForObject("mypageSql.mp_pointListCount", obj)).intValue();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PointVO> getPointList(Object obj) {
		Map<String, Object> map = new HashMap<String, Object>();
			map = (Map<String, Object>) obj;
		
		return getSqlMapClientTemplate()
				.queryForList("mypageSql.mp_pointList", obj);
	}

	
	/* ���������� : �ٿ�ε峻�� */
	@SuppressWarnings("unchecked")
	@Override
	public List<DownloadListVO> getDownloadList(Object obj) {
		Map<String, Object> map = new HashMap<String, Object>();
			map = (Map<String, Object>) obj;
		
		return getSqlMapClientTemplate()
				.queryForList("mypageSql.mp_downloadList", obj);
	}

	
	/* ���������� : ��������ٹ� */
	@SuppressWarnings("unchecked")
	@Override
	public List<AlbumVO> getAlbumList(Object obj) {
		Map<String, Object> map = new HashMap<String, Object>();
			map = (Map<String, Object>) obj;
		
		return getSqlMapClientTemplate()
				.queryForList("mypageSql.mp_albumList", obj);
	}

	
	/* ���������� : ȸ���������� */
	@Override
	public MemberVO getMemberInfo(String userID) {
		return (MemberVO) getSqlMapClientTemplate()
				.queryForObject("mypageSql.mp_getMemberInfo", userID);
	}

	@Override
	public void updateMemberInfo(MemberVO memberVO) {
		getSqlMapClientTemplate()
				.update("mypageSql.mp_updateMember", memberVO);
	}

	
	/* ���������� : ȸ��Ż�� */
	@Override
	public String getPass(String userID) {
		return String.valueOf(getSqlMapClientTemplate()
				.queryForObject("mypageSql.mp_getPass", userID));
	}

	@Override
	public void deleteMember(String userID) {
		getSqlMapClientTemplate()
				.delete("mypageSql.mp_deleteMember", userID);
	}
	
} //end- class