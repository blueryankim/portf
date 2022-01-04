package subak.uploadlink.model;

import java.util.Date;

public class UploadLinkVO {

	/**
	 * @uml.property  name="songname"
	 */
	private String songname;
	/**
	 * @uml.property  name="linkaddress"
	 */
	private String linkaddress;
	/**
	 * @uml.property  name="content"
	 */
	private String content;
	/**
	 * @uml.property  name="genre"
	 */
	private String genre;
	/**
	 * @uml.property  name="regdate"
	 */
	private Date regdate; 
	
	
	/**
	 * @return
	 * @uml.property  name="songname"
	 */
	public String getSongname() {
		return songname;
	}
	/**
	 * @param songname
	 * @uml.property  name="songname"
	 */
	public void setSongname(String songname) {
		this.songname = songname;
	}
	/**
	 * @return
	 * @uml.property  name="linkaddress"
	 */
	public String getLinkaddress() {
		return linkaddress;
	}
	/**
	 * @param linkaddress
	 * @uml.property  name="linkaddress"
	 */
	public void setLinkaddress(String linkaddress) {
		this.linkaddress = linkaddress;
	}
	/**
	 * @return
	 * @uml.property  name="content"
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content
	 * @uml.property  name="content"
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return
	 * @uml.property  name="genre"
	 */
	public String getGenre() {
		return genre;
	}
	/**
	 * @param genre
	 * @uml.property  name="genre"
	 */
	public void setGenre(String genre) {
		this.genre = genre;
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
