package subak.qcomment.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.qcomment.model.QCommentVO;


public class QIbatisCommentDao extends SqlMapClientDaoSupport implements
		QCommentDao {

	@Override
	public int count() {
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"commentSql.getListCount");
	}

	@Override
	public int nextVal() {

		return (Integer) getSqlMapClientTemplate().queryForObject(
				"commentSql.nextVal");
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<QCommentVO> select(int begin, int end, int num) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("start", begin);
		param.put("end", end);
		param.put("num", num);
		return getSqlMapClientTemplate().queryForList("commentSql.getList",
				param);
	}

	@Override
	public void insert(QCommentVO message) {
		getSqlMapClientTemplate().insert("commentSql.insertMessage", message);

	}

	@Override
	public void delete(int id) {
		getSqlMapClientTemplate().delete("commentSql.deleteMessage", id);

	}

	@Override
	public void update(QCommentVO message) {
		getSqlMapClientTemplate().update("commentSql.updateMessage", message);

	}

}
