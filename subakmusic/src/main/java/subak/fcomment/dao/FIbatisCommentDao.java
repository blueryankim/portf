package subak.fcomment.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import subak.fcomment.model.FCommentVO;


public class FIbatisCommentDao extends SqlMapClientDaoSupport implements
		FCommentDao {

	@Override
	public int count() {
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"fcommentSql.getListCount");
	}

	@Override
	public int nextVal() {

		return (Integer) getSqlMapClientTemplate().queryForObject(
				"fcommentSql.nextVal");
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<FCommentVO> select(int begin, int end, int num) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("start", begin);
		param.put("end", end);
		param.put("num", num);
		return getSqlMapClientTemplate().queryForList("fcommentSql.getList",
				param);
	}

	@Override
	public void insert(FCommentVO message) {
		getSqlMapClientTemplate().insert("fcommentSql.insertMessage", message);

	}

	@Override
	public void delete(int id) {
		getSqlMapClientTemplate().delete("fcommentSql.deleteMessage", id);

	}

	@Override
	public void update(FCommentVO message) {
		getSqlMapClientTemplate().update("fcommentSql.updateMessage", message);

	}

}
