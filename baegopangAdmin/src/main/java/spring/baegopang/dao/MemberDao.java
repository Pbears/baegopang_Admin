package spring.baegopang.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

@Component(value = "memberDao")
public class MemberDao extends SqlSessionDaoSupport{

}