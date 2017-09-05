package spring.baegopang.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import spring.baegopang.bean.DefaultBean;

@Component(value = "orderDao")
public class OrderDao extends SqlSessionDaoSupport implements dao{

	/* foodorder 테이블 paging 후 가져오기 */
	@Override
	public List<DefaultBean> paging(HashMap<Object, Object> map) {
		try {
			return this.getSqlSession().selectList("selectOrder", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/* foodorder 테이블의 승인 대기 상태 총 행 가져오기 */
	public int getOrderWaitTotalRow(){
		return this.getSqlSession().selectOne("getOrderWaitTotalRow");
	}
	
	/* foodorder 테이블의 배달 완료 상태 총 행 가져오기 */
	public int getOrderCompleteTotalRow(){
		return this.getSqlSession().selectOne("getOrderCompleteTotalRow");
	}
	
	/* foodorder 테이블의 배달중인 상태 총 행 가져오기 */
	public int getOrderingTotalRow(){
		return this.getSqlSession().selectOne("getOrderingTotalRow");
	}
	
	/* foodorder 테이블의 승인거절인 상태 총 행 가져오기 */
	public int getOrderNegativeTotalRow(){
		return this.getSqlSession().selectOne("getOrderNegativeTotalRow");
	}
	
}