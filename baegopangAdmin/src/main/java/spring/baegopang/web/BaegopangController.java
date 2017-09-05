package spring.baegopang.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.naming.Context;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.baegopang.bean.BrandBean;
import spring.baegopang.bean.FileModel;
import spring.baegopang.bean.MasterAskAdminBean;
import spring.baegopang.bean.MasterBean;
import spring.baegopang.bean.MenuBean;
import spring.baegopang.bean.NoticeBean;
import spring.baegopang.bean.PageBean;
import spring.baegopang.bean.StoreBean;
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
import spring.baegopang.dao.dao;

@Controller
public class BaegopangController {
	@Autowired
	ServletContext context;
	
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
	
	/* paging */
	public void paging(dao dao ,int total, int page, String mode, Model model) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		// 현재 페이지
		int currentPage = 0;
		// 한 페이지에 출력할 행의 갯수
		int pageScale = 5;
		// 총 데이터 행의 갯수
		int totalRow = 0;
		
		try {
			totalRow = total;
			currentPage = page;
		} catch (Exception e) {
			currentPage = 1;
		}
		
		// 총 페이지 수
		int totalPage = totalRow % pageScale == 0 ? totalRow / pageScale : totalRow / pageScale + 1;
		if (totalRow == 0)
			totalPage = 1;
		
		// 페이지의 첫 데이터 번호
		int start = 1 + (currentPage - 1) * pageScale;
		// 페이지의 마지막 데이터 번호
		int end = pageScale + (currentPage - 1) * pageScale;

		// 현재 블락
		int currentBlock = currentPage % pageScale == 0 ? (currentPage / pageScale) : (currentPage / pageScale) + 1;
		// 시작 페이지
		int startPage = 1 + (currentBlock - 1) * pageScale;
		// 마지막 페이지
		int endPage = pageScale + (currentBlock - 1) * pageScale;
		if (totalPage <= endPage)
			endPage = totalPage;
		
		map.put("start", start);
		map.put("end", end);
		if(mode!=null) {
			map.put("mode", mode);
		}
		
		model.addAttribute("list", dao.paging(map));
		model.addAttribute("pageBean", new PageBean(currentPage, totalPage, startPage, endPage, currentBlock));
	}
	
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
	public String brandAction(Model model, @RequestParam(value="pages")int pages) {
		paging(brandDao, brandDao.getBrandTotalRow(), pages, null, model);
		return "views/brand";
	}
	
	/* 사장 테이블 관리로 이동 */
	@RequestMapping(value="master.do")
	public String masterAction(Model model, @RequestParam(value="pages")int pages) {
		String mode = "master";
		paging(masterDao, masterDao.getMasterTotalRow(), pages, mode, model);
		return "views/master";
	}
	
	/* 사장 가입요청 테이블 관리로 이동 */
	@RequestMapping(value="requestSign.do")
	public String requestSignAction(Model model, @RequestParam(value="pages")int pages) {
		String mode = "request";
		paging(masterDao, masterDao.getMasterSignTotalRow(), pages, mode, model);
		model.addAttribute("unStoreNameList", storeDao.unStoreNameList());
		return "views/masterInRequest";
	}
	
	/* 사장 탈퇴요청 테이블 관리로 이동 */
	@RequestMapping(value="requestDrop.do")
	public String requestDropAction(Model model, @RequestParam(value="pages")int pages) {
		String mode = "drop";
		paging(masterDao, masterDao.getMasterDropTotalRow(), pages, mode, model);
		return "views/masterDrRequest";
	}
	
	/* 사용자 테이블 관리로 이동 */
	@RequestMapping(value="member.do")
	public String memberAction(Model model, @RequestParam(value="pages")int pages) {
		paging(memberDao, memberDao.getMemberTotalRow(), pages, null, model);
		return "views/member";
	}
	
	/* 메뉴 테이블 관리로 이동 */
	@RequestMapping(value="menu.do")
	public String menuAction(Model model, @RequestParam(value="pages")int pages) {
		paging(menuDao, menuDao.getMenuTotalRow(), pages, null, model);
		return "views/menu";
	}
	
	/* 음식점 테이블 관리로 이동 */
	@RequestMapping(value="store.do")
	public String storeAction(Model model, @RequestParam(value="pages")int pages) {
		String mode = "selected";
		// 사용할 Dao, 사용할 Dao의 총 행 수, 현재 페이지, mode, model 
		paging(storeDao, storeDao.getStoreTotalRow(), pages, mode, model);
		return "views/store";
	}
	
	/* 미지정 음식점 테이블 관리로 이동 */
	@RequestMapping(value="unStore.do")
	public String unStoreAction(Model model, @RequestParam(value="pages")int pages) {
		String mode = "unselected";
		paging(storeDao, storeDao.getUnSelectedStoreTotalRow(), pages, mode, model);
		return "views/unStore";
	}
	
	/* 배달 완료 테이블 관리로 이동 */
	@RequestMapping(value="orderComplete.do")
	public String orderCompleteAction(Model model, @RequestParam(value="pages")int pages) {
		String mode ="complete";
		paging(orderDao, orderDao.getOrderCompleteTotalRow(), pages, mode, model);
		return "views/orderComplete";
	}
	
	/* 주문 대기 테이블 관리로 이동 */
	@RequestMapping(value="orderWait.do")
	public String orderWaitAction(Model model, @RequestParam(value="pages")int pages) {
		String mode ="wait";
		paging(orderDao, orderDao.getOrderWaitTotalRow(), pages, mode, model);
		return "views/orderWait";
	}
	
	/* 주문 배달 중인 테이블 관리로 이동 */
	@RequestMapping(value="ordering.do")
	public String orderingAction(Model model, @RequestParam(value="pages")int pages) {
		String mode ="ordering";
		paging(orderDao, orderDao.getOrderingTotalRow(), pages, mode, model);
		return "views/ordering";
	}
	
	/* 주문 거절 테이블 관리로 이동 */
	@RequestMapping(value="orderNagative.do")
	public String orderNagativeAction(Model model, @RequestParam(value="pages")int pages) {
		String mode ="negative";
		paging(orderDao, orderDao.getOrderNegativeTotalRow(), pages, mode, model);
		return "views/orderNegative";
	}
	
	/* 공지사항 테이블 관리로 이동 */
	@RequestMapping(value="notice.do")
	public String noticeAction(Model model, @RequestParam(value="pages")int pages) {
		paging(noticeDao, noticeDao.getNoticeTotalRow(), pages, null, model);
		return "views/notice";
	}
	
	/* 문의 테이블 관리로 이동 */
	@RequestMapping(value="ask.do")
	public String askAction(Model model, @RequestParam(value="pages")int pages) {
		paging(masterAskAdminDao, masterAskAdminDao.getAskTotalRow(), pages, null, model);
		return "views/ask";
	}
	
	/* 브랜드 추가 페이지로 이동 */
	@RequestMapping(value="brandInsert.do")
	public String brandInsertAction() {
		return "views/brand/brandInsert";
	}
	
	/* 브랜드 추가 */
	@RequestMapping(value="brandInsertProcess.do", method = RequestMethod.POST)
	public String brandInsertProcessAction(MultipartHttpServletRequest request) {
		String rootPath = "/Users/babysean/git/baegopang_Admin/baegopangAdmin/src/main/webapp/img/brandLogo/";
		String brandNo = request.getParameter("brandNo");
		String brandName = request.getParameter("brandName");
		MultipartFile fileName = request.getFile("fileName");
		
		int intBrandNo = Integer.parseInt(brandDao.getNextBrandNo(brandNo))+1;
		
		BrandBean brand = new BrandBean(String.valueOf(intBrandNo),brandName,"/img/brandLogo/"+String.valueOf(intBrandNo)+".jpg");
		brandDao.insertBrand(brand);
		
		File file = new File(rootPath+String.valueOf(intBrandNo)+".jpg");
		try {
			fileName.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:brand.do?pages=1";
	}
	
	/* 미지정 음식점 추가 페이지로 이동 */
	@RequestMapping(value="unSelectedStoreInsert.do")
	public String unSelectedStoreInsert(Model model) {
		model.addAttribute("brandName", brandDao.getBrandName());
		return "views/unSelectStore/unSelectedStoreInsert";
	}
	
	/* 미지정 음식점 추가 진행*/
	@RequestMapping(value="unSelectedStoreInsertProcess.do")
	public String unSelectedStoreInsertProcess(@ModelAttribute("unStore")StoreBean unStore,@RequestParam(value="brandname")String brandname) {
		unStore.setStorename(brandname.split("_")[1]+"-"+unStore.getStorename());
		unStore.setBrandno(brandname.split("_")[0]);
		storeDao.insertUnStore(unStore);
		return "redirect:unStore.do?pages=1";
	}
	
	/* 공지사항 추가 페이지로 이동 */
	@RequestMapping(value="noticeInsert.do")
	public String noticeInsert() {
		return "views/notice/insert";
	}
	
	/* 공지사항 추가 */
	@RequestMapping(value="noticeInsertProcess.do")
	public String noticeInsertProcess(@ModelAttribute("notice")NoticeBean notice) {
		noticeDao.insertNotice(notice);
		return "redirect:notice.do?pages=1";
	}
	
	/* 공지사항 삭제 */
	@RequestMapping(value="noticeDelete.do")
	public String noticeDeleteProcess(@RequestParam(value="no")String no) {
		noticeDao.deleteNotice(no);
		return "redirect:notice.do?pages=1";
	}
	
	/* 문의 답글 등록 */
	@RequestMapping(value="askUpadte.do")
	public String askUpdate(@ModelAttribute("ask")MasterAskAdminBean ask) {
		masterAskAdminDao.askUpdate(ask);
		return "redirect:ask.do?pages=1";
	}
	
	/* 사장 탈퇴 요청 승인 */
	@RequestMapping(value="requestDropProcess.do")
	public String reqeustDropProcess(@RequestParam(value="id")String id) {
		masterDao.deleteMaster(id);
		return "redirect:requestDrop.do?pages=1";
	}
	
	/* 사장 가입 요청 승인 */
	@RequestMapping(value="masterInsert.do")
	public String requestInsertProcess(@RequestParam(value="id")String id,@RequestParam(value="pw")String pw,@RequestParam(value="name")String name,@RequestParam(value="address")String address,@RequestParam(value="tel")String tel,@RequestParam(value="birth")String birth,@RequestParam(value="storename")String storename) {
		System.out.println(id+" "+pw+" "+name+" "+address+" "+tel+" "+birth+" "+storename);
		MasterBean master = new MasterBean(id,pw,name,address,tel,birth,storename,0);
		masterDao.insertMaster(master);
		masterDao.deleteRequestMaster(id);
		storeDao.deleteUnStore(storename);
		return "redirect:requestSign.do?pages=1";
	}
	
	/* 사장 가입 요청 거절 */
	@RequestMapping(value="masterInsertRequestNegative.do")
	public String masterInsertRequestNegativeProcess(@RequestParam(value="id")String id) {
		masterDao.deleteRequestMaster(id);
		return "redirect:requestSign.do?pages=1";
	}
	
	/* 메뉴 추가 페이지로 이동 */
	@RequestMapping(value="menuInsert.do")
	public String menuInsertAction(Model model) {
		model.addAttribute("brandNameList", brandDao.getBrandName());
		return "views/menu/menuInsert";
	}
	
	@RequestMapping(value="menuInsertProcess.do")
	public String menuInsertProcessAction(MultipartHttpServletRequest request) {
		String rootPath = "/Users/babysean/git/baegopang_Admin/baegopangAdmin/src/main/webapp/img/menu/";
		String menuname = request.getParameter("menuName");
		String brandname = request.getParameter("brandName");
		int price = Integer.parseInt(request.getParameter("menuPrice"));
		String info = request.getParameter("menuInfo");
		MultipartFile fileName = request.getFile("fileName");
		
		String brandno = brandDao.selectBrandNo(brandname);
		
		MenuBean menu = new MenuBean(brandname+"-"+menuname, brandno, price, info, "/img/menu/"+brandno+"/"+brandname+"_"+menuname+".jpg");
		menuDao.insertMenu(menu);
		
		File file = new File(rootPath+brandno+"/"+brandname+"_"+menuname+".jpg");
		try {
			fileName.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:menu.do?pages=1";
	}
}
