package subak.fboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.fboard.model.FBoardVO;


public class FBoardDaoImpl extends SqlMapClientDaoSupport implements FBoardDao {
	@SuppressWarnings("unchecked")
	@Override
	public List<FBoardVO> getList(Object obj) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = (Map<String, Object>) obj;
		if (map.get("search_type").equals("all")) {
			return getSqlMapClientTemplate().queryForList(
					"fboardSql.getAllList", obj);
		} else if (map.get("search_type").equals("writer")) {
			return getSqlMapClientTemplate().queryForList(
					"fboardSql.getWriterList", obj);
		} else if (map.get("search_type").equals("subject")) {
			return getSqlMapClientTemplate().queryForList(
					"fboardSql.getSubjectList", obj);
		} else if (map.get("search_type").equals("content")) {
			return getSqlMapClientTemplate().queryForList(
					"fboardSql.getContentList", obj);
		} else {
			return getSqlMapClientTemplate().queryForList("fboardSql.getList",
					obj);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public int getListCount(Object obj) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = (Map<String, Object>) obj;
		if (map.get("search_type").equals("writer")) {
			return ((Integer) getSqlMapClientTemplate().queryForObject(
					"fboardSql.getWriterCount", obj)).intValue();
		} else if (map.get("search_type").equals("subject")) {
			return ((Integer) getSqlMapClientTemplate().queryForObject(
					"fboardSql.getSubjectCount", obj)).intValue();
		} else if (map.get("search_type").equals("content")) {
			return ((Integer) getSqlMapClientTemplate().queryForObject(
					"fboardSql.getContentCount", obj)).intValue();
		} else {
			return ((Integer) getSqlMapClientTemplate().queryForObject(
					"fboardSql.getAllCount", obj)).intValue();
		}
	}

	@Override
	// �۾���
	public void insertArticle(FBoardVO boardVo) {
		getSqlMapClientTemplate().insert("fboardSql.insertArticle", boardVo);
	}

	@Override
	// �ۺ���
	public FBoardVO getArticle(Integer num) {
		getSqlMapClientTemplate().update("fboardSql.upReadcount", num);
		return (FBoardVO) getSqlMapClientTemplate().queryForObject(
				"fboardSql.getArticle", num);
	}

	// �ۼ���
	@Override
	public void updateArticle(FBoardVO boardVo) {
		getSqlMapClientTemplate().update("fboardSql.updateArticle", boardVo);
	}

	// ��й�ȣ ��������
	@Override
	public String getPass(Integer num) {
		return String.valueOf(getSqlMapClientTemplate().queryForObject(
				"fboardSql.getPass", num));
	}

	// ��Ÿ�� ��������
	@Override
	public String getArticle_type(Integer num) {
		return String.valueOf(getSqlMapClientTemplate().queryForObject(
				"fboardSql.getArticle_type", num));
	}

	// �� ����
	@Override
	public void deleteArticle(Integer num) {
		getSqlMapClientTemplate().delete("fboardSql.deleteArticle", num);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<FBoardVO> getListForAdmin(Object obj) {
		return getSqlMapClientTemplate().queryForList("fboardSql.getAllListForAdmin",
				obj);
	}

	@Override
	public int getListCountForAdmin(Object obj) {
		return ((Integer) getSqlMapClientTemplate().queryForObject(
				"fboardSql.getAllCountForAdmin", obj)).intValue();
	}
}