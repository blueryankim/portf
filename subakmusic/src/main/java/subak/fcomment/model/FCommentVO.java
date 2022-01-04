package subak.fcomment.model;

import java.util.Date;

public class FCommentVO {
	/**
	 * @uml.property  name="comment_id"
	 */
	private int comment_id;
	/**
	 * @uml.property  name="num"
	 */
	private int num;
	/**
	 * @uml.property  name="comment_name"
	 */
	private String comment_name;
	/**
	 * @uml.property  name="comment"
	 */
	private String comment;
	/**
	 * @uml.property  name="regdate"
	 */
	private Date regdate;
	/**
	 * @return
	 * @uml.property  name="comment_id"
	 */
	public int getComment_id() {
		return comment_id;
	}
	/**
	 * @param comment_id
	 * @uml.property  name="comment_id"
	 */
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	/**
	 * @return
	 * @uml.property  name="num"
	 */
	public int getNum() {
		return num;
	}
	/**
	 * @param num
	 * @uml.property  name="num"
	 */
	public void setNum(int num) {
		this.num = num;
	}
	/**
	 * @return
	 * @uml.property  name="comment_name"
	 */
	public String getComment_name() {
		return comment_name;
	}
	/**
	 * @param comment_name
	 * @uml.property  name="comment_name"
	 */
	public void setComment_name(String comment_name) {
		this.comment_name = comment_name;
	}
	/**
	 * @return
	 * @uml.property  name="comment"
	 */
	public String getComment() {
		return comment;
	}
	/**
	 * @param comment
	 * @uml.property  name="comment"
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}
	/**
	 * @return
	 * @uml.property  name="regdate"
	 */
	public Date getRegdate() {
		return regdate;
	}
	/**
	 * @param regdate
	 * @uml.property  name="regdate"
	 */
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
