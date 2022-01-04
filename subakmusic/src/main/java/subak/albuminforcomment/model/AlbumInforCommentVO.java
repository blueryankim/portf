package subak.albuminforcomment.model;

import java.util.Date;

public class AlbumInforCommentVO {
	/**
	 * @uml.property  name="albumnum"
	 */
	private int albumnum;
	/**
	 * @uml.property  name="commentid"
	 */
	private int commentid;
	/**
	 * @uml.property  name="id"
	 */
	private String id;
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
	 * @uml.property  name="albumnum"
	 */
	public int getAlbumnum() {
		return albumnum;
	}
	/**
	 * @param albumnum
	 * @uml.property  name="albumnum"
	 */
	public void setAlbumnum(int albumnum) {
		this.albumnum = albumnum;
	}
	/**
	 * @return
	 * @uml.property  name="commentid"
	 */
	public int getCommentid() {
		return commentid;
	}
	/**
	 * @param commentid
	 * @uml.property  name="commentid"
	 */
	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}
	/**
	 * @return
	 * @uml.property  name="id"
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id
	 * @uml.property  name="id"
	 */
	public void setId(String id) {
		this.id = id;
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
