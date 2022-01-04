package subak.qboard.model;

import java.util.Date;

public class QBoardVO {
	/**
	 * @uml.property  name="num"
	 */
	private int num;
	/**
	 * @uml.property  name="writer"
	 */
	private String writer;
	/**
	 * @uml.property  name="email"
	 */
	private String email;
	/**
	 * @uml.property  name="subject"
	 */
	private String subject;
	/**
	 * @uml.property  name="pass"
	 */
	private String pass;
	/**
	 * @uml.property  name="readcount"
	 */
	private int readcount;
	/**
	 * @uml.property  name="regdate"
	 */
	private Date regdate;
	/**
	 * @uml.property  name="content"
	 */
	private String content;
	/**
	 * @uml.property  name="article_type"
	 */
	private String article_type;
	

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
	 * @uml.property  name="writer"
	 */
	public String getWriter() {
		return writer;
	}

	/**
	 * @param writer
	 * @uml.property  name="writer"
	 */
	public void setWriter(String writer) {
		this.writer = writer;
	}

	/**
	 * @return
	 * @uml.property  name="email"
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 * @uml.property  name="email"
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return
	 * @uml.property  name="subject"
	 */
	public String getSubject() {
		return subject;
	}

	/**
	 * @param subject
	 * @uml.property  name="subject"
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}

	/**
	 * @return
	 * @uml.property  name="pass"
	 */
	public String getPass() {
		return pass;
	}

	/**
	 * @param pass
	 * @uml.property  name="pass"
	 */
	public void setPass(String pass) {
		this.pass = pass;
	}

	/**
	 * @return
	 * @uml.property  name="readcount"
	 */
	public int getReadcount() {
		return readcount;
	}

	/**
	 * @param readcount
	 * @uml.property  name="readcount"
	 */
	public void setReadcount(int readcount) {
		this.readcount = readcount;
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
	 * @uml.property  name="article_type"
	 */
	public String getArticle_type() {
		return article_type;
	}

	/**
	 * @param article_type
	 * @uml.property  name="article_type"
	 */
	public void setArticle_type(String article_type) {
		this.article_type = article_type;
	}
}
