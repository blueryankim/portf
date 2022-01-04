package subak.qboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.qboard.model.QBoardVO;


public class BoardDaoImpl extends SqlMapClientDaoSupport implements QBoardDao {
	@SuppressWarnings("unchecked")
	@Override
	public List<QBoardVO> getList(Object obj) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = (Map<String, Object>) obj;
		if (map.get("search_type").equals("all")) {
			return getSqlMapClientTemplate().queryForList(
					"qboardSql.getAllList", obj);
		} else if (map.get("search_type").equals("writer")) {
			return getSqlMapClientTemplate().queryForList(
					"qboardSql.getWriterList", obj);
		} else if (map.get("search_type").equals("subject")) {
			return getSqlMapClientTemplate().queryForList(
					"qboardSql.getSubjectList", obj);
		} else if (map.get("search_type").equals("content")) {
			return getSqlMapClientTemplate().queryForList(
					"qboardSql.getContentList", obj);
		} else {
			return getSqlMapClientTemplate().queryForList("qboardSql.getList",
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
					"qboardSql.getWriterCount", obj)).intValue();
		} else if (map.get("search_type").equals("subject")) {
			return ((Integer) getSqlMapClientTemplate().queryForObject(
					"qboardSql.getSubjectCount", obj)).intValue();
		} else if (map.get("search_type").equals("content")) {
			return ((Integer) getSqlMapClientTemplate().queryForObject(
					"qboardSql.getContentCount", obj)).intValue();
		} else {
			return ((Integer) getSqlMapClientTemplate().queryForObject(
					"qboardSql.getAllCount", obj)).intValue();
		}
	}

	@Override
	// �۾���
	public void insertArticle(QBoardVO boardVo) {
		getSqlMapClientTemplate().insert("qboardSql.insertArticle", boardVo);
	}

	@Override
	// �ۺ���
	public QBoardVO getArticle(Integer num) {
		getSqlMapClientTemplate().update("qboardSql.upReadcount", num);
		return (QBoardVO) getSqlMapClientTemplate().queryForObject(
				"qboardSql.getArticle", num);
	}

	// �ۼ���
	@Override
	public void updateArticle(QBoardVO boardVo) {
		getSqlMapClientTemplate().update("qboardSql.updateArticle", boardVo);
	}

	// ��й�ȣ ��������
	@Override
	public String getPass(Integer num) {
		return String.valueOf(getSqlMapClientTemplate().queryForObject(
				"qboardSql.getPass", num));
	}

	// ��Ÿ�� ��������
	@Override
	public String getArticle_type(Integer num) {
		return String.valueOf(getSqlMapClientTemplate().queryForObject(
				"qboardSql.getArticle_type", num));
	}

	// �� ����
	@Override
	public void deleteArticle(Integer num) {
		getSqlMapClientTemplate().delete("qboardSql.deleteArticle", num);
	}
}