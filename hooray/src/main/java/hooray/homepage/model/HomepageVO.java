package hooray.homepage.model;

import java.util.Date;

public class HomepageVO {
	
	private int projectNum;
	private String email;
	private String maintitle;
	private String name;
	private String subtitle;
	private int currentpeople;
	private int limitpeople;
	private int leavedate;
	private int count;
	private Date regdate;
	private int categori;
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
	
	
	
	public int getCategori() {
		return categori;
	}
	public void setCategori(int categori) {
		this.categori = categori;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getProjectNum() {
		return projectNum;
	}
	public void setProjectNum(int projectNum) {
		this.projectNum = projectNum;
	}
	public String getMaintitle() {
		return maintitle;
	}
	public void setMaintitle(String maintitle) {
		this.maintitle = maintitle;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public int getCurrentpeople() {
		return currentpeople;
	}
	public void setCurrentpeople(int currentpeople) {
		this.currentpeople = currentpeople;
	}
	public int getLimitpeople() {
		return limitpeople;
	}
	public void setLimitpeople(int limitpeople) {
		this.limitpeople = limitpeople;
	}
	public int getLeavedate() {
		return leavedate;
	}
	public void setLeavedate(int leavedate) {
		this.leavedate = leavedate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
	

}
