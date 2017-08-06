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
	
	/* 홈으로 이동 */
	@RequestMapping(value="home.do")
	public String homeAction() {
		return "views/main";
	}
	
	/* 그래프 관리로 이동 */
	@RequestMapping(value="chart.do")
	public String chartAction() {
		return "views/chart";
	}
	
	/* 브랜드 테이블 관리로 이동 */
	@RequestMapping(value="brand.do")
	public String brandAction() {
		return "views/brand";
	}
	
	/* 사장 테이블 관리로 이동 */
	@RequestMapping(value="master.do")
	public String masterAction() {
		return "views/master";
	}
	
	/* 사장 가입요청 테이블 관리로 이동 */
	@RequestMapping(value="requestSign.do")
	public String requestSignAction() {
		return "views/masterInRequest";
	}
	
	/* 사장 탈퇴요청 테이블 관리로 이동 */
	@RequestMapping(value="requestDrop.do")
	public String requestDropAction() {
		return "views/masterDrRequest";
	}
	
	/* 사용자 테이블 관리로 이동 */
	@RequestMapping(value="member.do")
	public String memberAction() {
		return "views/member";
	}
	
	/* 메뉴 테이블 관리로 이동 */
	@RequestMapping(value="menu.do")
	public String menuAction() {
		return "views/menu";
	}
	
	/* 음식점 테이블 관리로 이동 */
	@RequestMapping(value="store.do")
	public String storeAction() {
		return "views/store";
	}
	
	/* 미지정 음식점 테이블 관리로 이동 */
	@RequestMapping(value="unStore.do")
	public String unStoreAction() {
		return "views/unStore";
	}
	
	/* 주문 완료 테이블 관리로 이동 */
	@RequestMapping(value="orderComplete.do")
	public String orderCompleteAction() {
		return "views/orderComplete";
	}
	
	/* 주문 대기 테이블 관리로 이동 */
	@RequestMapping(value="orderWait.do")
	public String orderWaitAction() {
		return "views/orderWait";
	}
	
	/* 주문 배달 중인 테이블 관리로 이동 */
	@RequestMapping(value="ordering.do")
	public String orderingAction() {
		return "views/ordering";
	}
	
	/* 주문 거절 테이블 관리로 이동 */
	@RequestMapping(value="orderNagative.do")
	public String orderNagativeAction() {
		return "views/orderNegative";
	}
	
	/* 공지사항 테이블 관리로 이동 */
	@RequestMapping(value="notice.do")
	public String noticeAction() {
		return "views/notice";
	}
	
	/* 문의 테이블 관리로 이동 */
	@RequestMapping(value="ask.do")
	public String askAction() {
		return "views/ask";
	}
	
}
