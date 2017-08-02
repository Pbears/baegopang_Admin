package spring.baegopang.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

@Component(value = "menuDao")
public class MenuDao extends SqlSessionDaoSupport{
	
}