package spring.baegopang.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import spring.baegopang.bean.DefaultBean;
import spring.baegopang.bean.MenuBean;

@Component(value = "menuDao")
public class MenuDao extends SqlSessionDaoSupport implements dao{
	/* menu 테이블 paging 후 가져오기 */
	@Override
	public List<DefaultBean> paging(HashMap<Object, Object> map) {
		try {
			return this.getSqlSession().selectList("selectMenu", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/* menu 테이블의 총 행 가져오기 */
	public int getMenuTotalRow(){
		return this.getSqlSession().selectOne("getMenuTotalRow");
	}
	
	/* menu 추가 */
	public void insertMenu(MenuBean menu) {
		this.getSqlSession().insert("insertMenu", menu);
	}
}