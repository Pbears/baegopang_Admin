package spring.baegopang.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import spring.baegopang.bean.BrandBean;

@Component(value = "brandDao")
public class BrandDao extends SqlSessionDaoSupport {
	
	/* brand 테이블 모두 가져오기 */
	public List<BrandBean> selectAllBrand() {
		return this.getSqlSession().selectList("selectAllBrand");
	}

	/* brand 테이블의 총 행 가져오기 */
	public int getBrandTotalRow(){
		return this.getSqlSession().selectOne("getBrandTotalRow");
	}
	
}