package spring.baegopang.bean;

public class MasterAskAdminBean implements DefaultBean{
	private String no;
	private String title;
	private String masterinfo;
	private String masterid;
	private String admininfo;
	private String adminid;
	private String regdate;
	private int hit;

	public MasterAskAdminBean() {
		super();
	}

	public MasterAskAdminBean(String no, String title, String masterinfo, String masterid, String admininfo,
			String adminid, String regdate, int hit) {
		super();
		this.no = no;
		this.title = title;
		this.masterinfo = masterinfo;
		this.masterid = masterid;
		this.admininfo = admininfo;
		this.adminid = adminid;
		this.regdate = regdate;
		this.hit = hit;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMasterinfo() {
		return masterinfo;
	}

	public void setMasterinfo(String masterinfo) {
		this.masterinfo = masterinfo;
	}

	public String getMasterid() {
		return masterid;
	}

	public void setMasterid(String masterid) {
		this.masterid = masterid;
	}

	public String getAdmininfo() {
		return admininfo;
	}

	public void setAdmininfo(String admininfo) {
		this.admininfo = admininfo;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "MasterAskAdminBean [no=" + no + ", title=" + title + ", masterinfo=" + masterinfo + ", masterid="
				+ masterid + ", admininfo=" + admininfo + ", adminid=" + adminid + ", regdate=" + regdate + ", hit="
				+ hit + "]";
	}

	
}
