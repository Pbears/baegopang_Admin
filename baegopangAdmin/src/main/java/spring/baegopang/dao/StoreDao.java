package spring.baegopang.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import spring.baegopang.bean.DefaultBean;
import spring.baegopang.bean.StoreBean;

@Component(value = "storeDao")
public class StoreDao extends SqlSessionDaoSupport implements dao{

	/* store 테이블 paging 후 가져오기 */
	@Override
	public List<DefaultBean> paging(HashMap<Object, Object> map) {
		try {
			return this.getSqlSession().selectList("selectStore", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/* store 테이블의 총 행 가져오기 */
	public int getStoreTotalRow(){
		return this.getSqlSession().selectOne("getStoreTotalRow");
	}
	
	/* unselectedstore 테이블의 총 행 가져오기 */
	public int getUnSelectedStoreTotalRow(){
		return this.getSqlSession().selectOne("getUnSelectedStoreTotalRow");
	}
	
	/* 미지정 음식점 이름 모두 가져오기 */
	public List<StoreBean> unStoreNameList(){
		return this.getSqlSession().selectList("unStoreNameList");
	}
	
	/* 미지정 음식점 등록하기 */
	public void insertUnStore(StoreBean store) {
		this.getSqlSession().insert("insertUnStore", store);
	}
	
	/* 미지정 음식점 삭제하기*/
	public void deleteUnStore(String storename) {
		this.getSqlSession().delete("deleteUnStore", storename);
	}
}