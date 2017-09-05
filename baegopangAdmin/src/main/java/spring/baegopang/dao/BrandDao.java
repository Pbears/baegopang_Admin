package spring.baegopang.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import spring.baegopang.bean.BrandBean;
import spring.baegopang.bean.DefaultBean;

@Component(value = "brandDao")
public class BrandDao extends SqlSessionDaoSupport implements dao{
	
	/* brand 테이블 paging 후 가져오기 */
	@Override
	public List<DefaultBean> paging(HashMap<Object, Object> map) {
		try {
			return this.getSqlSession().selectList("selectBrand", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/* brand 테이블의 총 행 가져오기 */
	public int getBrandTotalRow(){
		return this.getSqlSession().selectOne("getBrandTotalRow");
	}
	
	/* brand 이름 모두 가져오기 */
	public List<BrandBean> getBrandName(){
		return this.getSqlSession().selectList("getBrandName");
	}
	
	/* 다음 brandno 구하기 */
	public String getNextBrandNo(String brandNo) {
		return this.getSqlSession().selectOne("getNextBrandNo",brandNo);
	}
	
	/* brand 추가 */
	public void insertBrand(BrandBean brand) {
		this.getSqlSession().insert("insertBrand", brand);
	}
	
	/* brandno 찾기 */
	public String selectBrandNo(String brandname) {
		return this.getSqlSession().selectOne("selectBrandNo", brandname);
	}
	
}