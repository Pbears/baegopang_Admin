package spring.baegopang.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

@Component(value="adminDao")
public class AdminDao extends SqlSessionDaoSupport{
	
	/* 비밀번호 확인 */
	public boolean pwCheck(String id, String pw){
		String dbPw = this.getSqlSession().selectOne("pwCheck", id);
		return pw.equals(dbPw)?true:false;
	}
	
}
