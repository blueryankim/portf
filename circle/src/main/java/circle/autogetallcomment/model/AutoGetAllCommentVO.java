package circle.autogetallcomment.model;

import java.util.Date;

public class AutoGetAllCommentVO {
	
	private int num;
	private int gulnum;
	private String id;
	private String writer;
	private String comment;
	private Date regdate;
	private String profileimg;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getGulnum() {
		return gulnum;
	}
	public void setGulnum(int gulnum) {
		this.gulnum = gulnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getProfileimg() {
		return profileimg;
	}
	public void setProfileimg(String profileimg) {
		this.profileimg = profileimg;
	}
	
	

}
