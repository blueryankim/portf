package subak.nboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import subak.nboard.model.BoardVO;

public class BoardDaoImpl extends SqlMapClientDaoSupport implements BoardDao {
	
	@SuppressWarnings("unchecked")
	@Override
	public List<BoardVO> getList(Object obj) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = (Map<String, Object>) obj;
		if (map.get("search_type").equals("all")) {
			return getSqlMapClientTemplate()
					.queryForList("boardSql.getAllList", obj);
		} else if (map.get("search_type").equals("writer")) {
			return getSqlMapClientTemplate()
					.queryForList("boardSql.getWriterList", obj);
		} else if (map.get("search_type").equals("subject")) {
			return getSqlMapClientTemplate()
					.queryForList("boardSql.getSubjectList", obj);
		} else if (map.get("search_type").equals("content")) {
			return getSqlMapClientTemplate()
					.queryForList("boardSql.getContentList", obj);
		} else {
			return getSqlMapClientTemplate()
					.queryForList("boardSql.getList", obj);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public int getListCount(Object obj) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = (Map<String, Object>) obj;
		if (map.get("search_type").equals("writer")) {
			return ((Integer) getSqlMapClientTemplate().queryForObject(
					"boardSql.getWriterCount", obj)).intValue();
		} else if (map.get("search_type").equals("subject")) {
			return ((Integer) getSqlMapClientTemplate().queryForObject(
					"boardSql.getSubjectCount", obj)).intValue();
		} else if (map.get("search_type").equals("content")) {
			return ((Integer) getSqlMapClientTemplate().queryForObject(
					"boardSql.getContentCount", obj)).intValue();
		} else {
			return ((Integer) getSqlMapClientTemplate().queryForObject(
					"boardSql.getAllCount", obj)).intValue();
		}
	}

	@Override
	// �۾���
	public void insertArticle(BoardVO boardVo) {
		getSqlMapClientTemplate().insert("boardSql.insertArticle", boardVo);
	}

	@Override
	// �ۺ���
	public BoardVO getArticle(Integer num) {
		getSqlMapClientTemplate().update("boardSql.upReadcount", num);
		return (BoardVO) getSqlMapClientTemplate().queryForObject(
				"boardSql.getArticle", num);
	}

	// �ۼ���
	@Override
	public void updateArticle(BoardVO boardVo) {
		getSqlMapClientTemplate().update("boardSql.updateArticle", boardVo);
	}

	// ��й�ȣ ��������
	@Override
	public String getPass(Integer num) {
		return String.valueOf(getSqlMapClientTemplate().queryForObject(
				"boardSql.getPass", num));
	}

	// ��Ÿ�� ��������
	@Override
	public String getArticle_type(Integer num) {
		return String.valueOf(getSqlMapClientTemplate().queryForObject(
				"boardSql.getArticle_type", num));
	}

	// �� ����
	@Override
	public void deleteArticle(Integer num) {
		getSqlMapClientTemplate().delete("boardSql.deleteArticle", num);
	}
}