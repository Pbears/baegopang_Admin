package spring.baegopang.bean;

public class NoticeBean implements DefaultBean{
	private String no;
	private String adminid;
	private String title;
	private String info;
	private String regdate;

	public NoticeBean() {
		super();
	}

	public NoticeBean(String no, String adminid, String title, String info, String regdate) {
		super();
		this.no = no;
		this.adminid = adminid;
		this.title = title;
		this.info = info;
		this.regdate = regdate;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "NoticeBean [no=" + no + ", adminid=" + adminid + ", title=" + title + ", info=" + info + ", regdate="
				+ regdate + "]";
	}

}
