package spring.baegopang.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import spring.baegopang.bean.DefaultBean;
import spring.baegopang.bean.NoticeBean;

@Component(value = "noticeDao")
public class NoticeDao extends SqlSessionDaoSupport implements dao{

	/* notice 테이블 paging 후 가져오기 */
	@Override
	public List<DefaultBean> paging(HashMap<Object, Object> map) {
		try {
			return this.getSqlSession().selectList("selectNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/* notice 테이블 총 행 가져오기 */
	public int getNoticeTotalRow(){
		return this.getSqlSession().selectOne("getNoticeTotalRow");
	}
	
	/* 공지사항 등록 */
	public void insertNotice(NoticeBean notice) {
		this.getSqlSession().insert("insertNotice", notice);
	}
	
	/* 공지사항 삭제 */
	public void deleteNotice(String no) {
		this.getSqlSession().delete("deleteNotice", no);
	}
}