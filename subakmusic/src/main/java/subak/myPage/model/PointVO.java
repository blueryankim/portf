package subak.myPage.model;

import java.sql.Timestamp;

public class PointVO {
	/**
	 * @uml.property  name="p_id"
	 */
	private String p_id;
	/**
	 * @uml.property  name="p_point"
	 */
	private int p_point;
	/**
	 * @uml.property  name="p_usesave"
	 */
	private String p_usesave;
	/**
	 * @uml.property  name="p_note"
	 */
	private String p_note;
	/**
	 * @uml.property  name="p_date"
	 */
	private Timestamp p_date;

	/**
	 * @return
	 * @uml.property  name="p_id"
	 */
	public String getP_id() {
		return p_id;
	}

	/**
	 * @param p_id
	 * @uml.property  name="p_id"
	 */
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	/**
	 * @return
	 * @uml.property  name="p_point"
	 */
	public int getP_point() {
		return p_point;
	}

	/**
	 * @param p_point
	 * @uml.property  name="p_point"
	 */
	public void setP_point(int p_point) {
		this.p_point = p_point;
	}

	/**
	 * @return
	 * @uml.property  name="p_usesave"
	 */
	public String getP_usesave() {
		return p_usesave;
	}

	/**
	 * @param p_usesave
	 * @uml.property  name="p_usesave"
	 */
	public void setP_usesave(String p_usesave) {
		this.p_usesave = p_usesave;
	}

	/**
	 * @return
	 * @uml.property  name="p_note"
	 */
	public String getP_note() {
		return p_note;
	}

	/**
	 * @param p_note
	 * @uml.property  name="p_note"
	 */
	public void setP_note(String p_note) {
		this.p_note = p_note;
	}

	/**
	 * @return
	 * @uml.property  name="p_date"
	 */
	public Timestamp getP_date() {
		return p_date;
	}

	/**
	 * @param p_date
	 * @uml.property  name="p_date"
	 */
	public void setP_date(Timestamp p_date) {
		this.p_date = p_date;
	}

}