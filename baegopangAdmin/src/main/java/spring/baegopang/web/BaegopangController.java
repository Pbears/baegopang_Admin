package spring.baegopang.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.baegopang.dao.AdminDao;
import spring.baegopang.dao.BrandDao;
import spring.baegopang.dao.ChartDao;
import spring.baegopang.dao.MasterAskAdminDao;
import spring.baegopang.dao.MasterDao;
import spring.baegopang.dao.MemberDao;
import spring.baegopang.dao.MenuDao;
import spring.baegopang.dao.NoticeDao;
import spring.baegopang.dao.OrderDao;
import spring.baegopang.dao.StoreDao;

@Controller
public class BaegopangController {
	@Resource(name = "adminDao")
	private AdminDao adminDao;
	@Resource(name = "brandDao")
	private BrandDao brandDao;
	@Resource(name = "chartDao")
	private ChartDao chartDao;
	@Resource(name = "masterAskAdminDao")
	private MasterAskAdminDao masterAskAdminDao;
	@Resource(name = "masterDao")
	private MasterDao masterDao;
	@Resource(name = "memberDao")
	private MemberDao memberDao;
	@Resource(name = "menuDao")
	private MenuDao menuDao;
	@Resource(name = "noticeDao")
	private NoticeDao noticeDao;
	@Resource(name = "orderDao")
	private OrderDao orderDao;
	@Resource(name = "storeDao")
	private StoreDao storeDao;

	/* 실행 */
	@RequestMapping(value = "index.do")
	public String indexAction() {
		return "views/login";
	}

	/* 로그인 처리 */
	@RequestMapping(value="loginProcess.do")
	public String loginProcessAction(@RequestParam(value="id")String id,
			@RequestParam(value="pw")String pw, HttpSession session) {
		if(adminDao.pwCheck(id, pw)) {
			session.setAttribute("id", id);
			return "views/main";
		}else {
			return "redirect:index.do";
		}
	}
	
	/* 로그아웃 처리 */
	@RequestMapping(value="logout.do")
	public String logoutAction(HttpSession session) {
		session.invalidate();
		return "redirect:index.do";
	}
}
