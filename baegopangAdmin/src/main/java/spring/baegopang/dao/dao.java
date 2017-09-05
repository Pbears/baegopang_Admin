package spring.baegopang.dao;


import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import spring.baegopang.bean.BrandBean;
import spring.baegopang.bean.DefaultBean;

@Component(value = "dao")
public interface dao {
	public List<DefaultBean> paging(HashMap<Object, Object> map);
}
