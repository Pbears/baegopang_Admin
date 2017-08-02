package spring.baegopang.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

@Component(value = "orderDao")
public class OrderDao extends SqlSessionDaoSupport{
	
}