package subak.myPage.model;

import java.sql.Timestamp;

public class DownloadListVO {
	// Download table
	/**
	 * @uml.property  name="d_id"
	 */
	private String d_id;
	/**
	 * @uml.property  name="d_mnum"
	 */
	private int d_mnum;
	/**
	 * @uml.property  name="d_date"
	 */
	private Timestamp d_date;
	// Musiclist table (join)
	/**
	 * @uml.property  name="m_title"
	 */
	private String m_title;
	/**
	 * @uml.property  name="m_singer"
	 */
	private String m_singer;

	/**
	 * @return
	 * @uml.property  name="d_id"
	 */
	public String getD_id() {
		return d_id;
	}

	/**
	 * @param d_id
	 * @uml.property  name="d_id"
	 */
	public void setD_id(String d_id) {
		this.d_id = d_id;
	}

	/**
	 * @return
	 * @uml.property  name="d_mnum"
	 */
	public int getD_mnum() {
		return d_mnum;
	}

	/**
	 * @param d_mnum
	 * @uml.property  name="d_mnum"
	 */
	public void setD_mnum(int d_mnum) {
		this.d_mnum = d_mnum;
	}

	/**
	 * @return
	 * @uml.property  name="d_date"
	 */
	public Timestamp getD_date() {
		return d_date;
	}

	/**
	 * @param d_date
	 * @uml.property  name="d_date"
	 */
	public void setD_date(Timestamp d_date) {
		this.d_date = d_date;
	}

	/**
	 * @return
	 * @uml.property  name="m_title"
	 */
	public String getM_title() {
		return m_title;
	}

	/**
	 * @param m_title
	 * @uml.property  name="m_title"
	 */
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}

	/**
	 * @return
	 * @uml.property  name="m_singer"
	 */
	public String getM_singer() {
		return m_singer;
	}

	/**
	 * @param m_singer
	 * @uml.property  name="m_singer"
	 */
	public void setM_singer(String m_singer) {
		this.m_singer = m_singer;
	}

}