package spring.baegopang.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import spring.baegopang.bean.DefaultBean;
import spring.baegopang.bean.MasterAskAdminBean;

@Component(value = "masterAskAdminDao")
public class MasterAskAdminDao extends SqlSessionDaoSupport implements dao{

	/* masteraskadmin 테이블 paging 후 가져오기 */
	@Override
	public List<DefaultBean> paging(HashMap<Object, Object> map) {
		try {
			return this.getSqlSession().selectList("selectAsk", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/* masteraskadmin 테이블 총 행 가져오기 */
	public int getAskTotalRow(){
		return this.getSqlSession().selectOne("getAskTotalRow");
	}
	
	/* 답글 등록 */
	public void askUpdate(MasterAskAdminBean ask) {
		this.getSqlSession().update("askUpdate", ask);
	}
}