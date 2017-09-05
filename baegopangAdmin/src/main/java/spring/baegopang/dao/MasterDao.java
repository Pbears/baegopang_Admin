package spring.baegopang.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import spring.baegopang.bean.DefaultBean;
import spring.baegopang.bean.MasterBean;

@Component(value = "masterDao")
public class MasterDao extends SqlSessionDaoSupport implements dao{

	/* brand 테이블 paging 후 가져오기 */
	@Override
	public List<DefaultBean> paging(HashMap<Object, Object> map) {
		try {
			return this.getSqlSession().selectList("selectMaster", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/* master 테이블의 총 행 가져오기 */
	public int getMasterTotalRow(){
		return this.getSqlSession().selectOne("getMasterTotalRow");
	}
	
	/* requestsignup 테이블의 총 행 가져오기 */
	public int getMasterSignTotalRow(){
		return this.getSqlSession().selectOne("getMasterSignTotalRow");
	}
	
	/* requestdrop 테이블의 총 행 가져오기 */
	public int getMasterDropTotalRow(){
		return this.getSqlSession().selectOne("getMasterDropTotalRow");
	}
	
	/* 사장 삭제 */
	public void deleteMaster(String id) {
		this.getSqlSession().delete("deleteMaster", id);
	}
	
	/* 가입 요청 테이블에서 제거 */
	public void deleteRequestMaster(String id) {
		this.getSqlSession().delete("deleteRequestMaster", id);
	}
	
	/* 사장 등록 */
	public void insertMaster(MasterBean master) {
		this.getSqlSession().insert("insertMaster", master);
	}
	
}