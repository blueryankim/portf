package subak.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import subak.member.model.MemberVO;

public class MemberDaoImpl extends SqlMapClientDaoSupport implements MemberDao {

	@Override
	public void insertMember(MemberVO memberVO) {

		getSqlMapClientTemplate().insert("memberSql.insertMember", memberVO);

	}

	@Override
	public Integer selectId(String id) {

		return ((Integer) getSqlMapClientTemplate().queryForObject(
				"memberSql.selectId", id));
		// .intValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberVO> getList(Object obj) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = (Map<String, Object>) obj;

		if (map.get("search_type").equals("id")) {
			return getSqlMapClientTemplate().queryForList(
					"memberSql.getIdList", obj);
		} else if (map.get("search_type").equals("name")) {
			return getSqlMapClientTemplate().queryForList(
					"memberSql.getNameList", obj);
		} else {
			return getSqlMapClientTemplate().queryForList("memberSql.getList",
					obj);
		}
	}

	@Override
	public void deleteMember(String id) {
		getSqlMapClientTemplate().delete("memberSql.deleteMember", id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public int getListCount(Object obj) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (obj == null) {
			map.put("search_type", "");
		} else {
			map = (Map<String, Object>) obj;
		}
		if (map.get("search_type").equals("id")) {
			return ((Integer) getSqlMapClientTemplate().queryForObject(
					"memberSql.getIdCount", obj)).intValue();
		} else if (map.get("search_type").equals("name")) {
			return ((Integer) getSqlMapClientTemplate().queryForObject(
					"memberSql.getNameCount", obj)).intValue();
		} else {
			return ((Integer) getSqlMapClientTemplate().queryForObject(
					"memberSql.getAllCount")).intValue();
		}
	}

	/*
	 * @SuppressWarnings("unchecked")
	 * 
	 * @Override public List<MemberVO>getAllMemberList(){
	 * return(List<MemberVO>)getSqlMapClientTemplate
	 * ().queryForList("MemberSql.getAllMemberList"); }
	 * 
	 * @Override public int getListCount(Object obj) { // TODO Auto-generated
	 * method stub return 0; }
	 * 
	 * @Override public void insertMember(MemberVO memberVO) {
	 * getSqlMapClientTemplate().insert("memberSql.insertMember", memberVO); }
	 * 
	 * @Override public MemberVO getMember(Integer num) { // TODO Auto-generated
	 * method stub return null; }
	 * 
	 * @Override public void updateMember(MemberVO memberVO) { // TODO
	 * Auto-generated method stub }
	 * 
	 * @Override public String getId(String id) { // TODO Auto-generated method
	 * stub return null; }
	 * 
	 * @Override public String getId_type(String id) { // TODO Auto-generated
	 * method stub return null; }
	 * 
	 * @Override public void deleteMember(Integer num) { // TODO Auto-generated
	 * method stub
	 * 
	 * }
	 * 
	 * @Override public List<MemberVO> getList(Object obj) { // TODO
	 * Auto-generated method stub return null; }
	 */

}
