package spring.baegopang.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import spring.baegopang.bean.DefaultBean;

@Component(value = "memberDao")
public class MemberDao extends SqlSessionDaoSupport implements dao{
	
	
	
	@Override
	public List<DefaultBean> paging(HashMap<Object, Object> map) {
		try {
			return this.getSqlSession().selectList("selectMember", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/* member 테이블의 총 행 가져오기 */
	public int getMemberTotalRow(){
		return this.getSqlSession().selectOne("getMemberTotalRow");
	}
}