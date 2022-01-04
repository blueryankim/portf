package hooray.uploadproject.model;

public class UploadProjectVO {
	private int projectNum;
	private String email;
	private String name;
	private int categori;
	private String maintitle;
	private String subtitle;
	private int limitpeople;
	private String period;
	private String content;
	private int lastimgnum;
	private int imgchangeflag;
	private String state;
	private String city;
	
	
	
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getImgchangeflag() {
		return imgchangeflag;
	}
	public void setImgchangeflag(int imgchangeflag) {
		this.imgchangeflag = imgchangeflag;
	}
	public int getLastimgnum() {
		return lastimgnum;
	}
	public void setLastimgnum(int lastimgnum) {
		this.lastimgnum = lastimgnum;
	}
	public int getProjectNum() {
		return projectNum;
	}
	public void setProjectNum(int projectNum) {
		this.projectNum = projectNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getCategori() {
		return categori;
	}
	public void setCategori(int categori) {
		this.categori = categori;
	}
	public String getMaintitle() {
		return maintitle;
	}
	public void setMaintitle(String maintitle) {
		this.maintitle = maintitle;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public int getLimitpeople() {
		return limitpeople;
	}
	public void setLimitpeople(int limitpeople) {
		this.limitpeople = limitpeople;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	

}
