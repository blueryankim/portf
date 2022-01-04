package subak.searchmusic.model;

public class Paging {

	/**
	 * @uml.property  name="w_size"
	 */
	private int w_size;
	/**
	 * @uml.property  name="p_size"
	 */
	private int p_size;
	/**
	 * @uml.property  name="writing_Count"
	 */
	private int writing_Count;
	/**
	 * @uml.property  name="cur_Page"
	 */
	private int cur_Page;

	public Paging() {
		super();
		// TODO Auto-generated constructor stub
	}

	// paging(�� ȭ�鿡 ������ �� ��,������ ��ȣ ǥ�ü� , �ѱ��� ����, ���� ���� �ִ� ������ ��ȣ)

	public void setPaging(int w_size, int p_size,
			int writing_Count, int cur_Page) {
		this.w_size = w_size;
		this.p_size = p_size;
		this.writing_Count = writing_Count;
		this.cur_Page = cur_Page;

	}

	// �� ������ ���� �������ִ� �޼ҵ� ��ü �ۼ��� �������� ������ �ۼ��� ���� ���� ��ü �ۼ��� �������� ������ �ۼ��� ������
	// ������ �Ͽ� ���Ѱ��� 0���� ũ�� 1�� ���ϰ� �ƴϸ� 0�� ���� return ����������

	public int getPage_Count() {
		return (writing_Count / w_size) + (writing_Count % w_size > 0 ? 1 : 0);
	}

	// ������ ���� ���� �������ִ� �޼ҵ�
	// @return ������ ���ۼ�

	public int getPage_Start() {
		return ((cur_Page - 1) / p_size) * p_size + 1;
	}
	          
	// ������ ������ ���� �������ִ� �޼ҵ�
	// @return ������ ������ ��

	public int getPage_End() {
		return Math.min(getPage_Start() + p_size - 1, getPage_Count());
	}

	// '����' ǥ�� ����
	// @return boolean
	public boolean isPre() {
		return getPage_Start() != 1;
	}

	// '����' ǥ�� ����
	// @return boolean

	public boolean isNext() {
		return getPage_End() < getPage_Count();
	}

	// �� ���� ���� ��ȣ
	// @return �� ���� ���� ��ȣ
	public int getWriting_Start() {
		return getWriting_End() - w_size + 1;
	}

	// �� ���� �� ��ȣ
	// @return �۹��� ����ȣ
	public int getWriting_End() {
		return cur_Page * w_size;
	}

	/**
	 * @return
	 * @uml.property  name="w_size"
	 */
	public int getW_size() {
		return w_size;
	}

	public void setW_size(Integer w_size) {
		this.w_size = w_size;
	}

	/**
	 * @return
	 * @uml.property  name="p_size"
	 */
	public int getP_size() {
		return p_size;
	}

	public void setP_size(Integer p_size) {
		this.p_size = p_size;
	}

	/**
	 * @return
	 * @uml.property  name="writing_Count"
	 */
	public int getWriting_Count() {
		return writing_Count;
	}

	public void setWriting_Count(Integer writing_Count) {
		this.writing_Count = writing_Count;
	}

	/**
	 * @return
	 * @uml.property  name="cur_Page"
	 */
	public int getCur_Page() {
		return cur_Page;
	}

	public void setCur_Page(Integer cur_Page) {
		this.cur_Page = cur_Page;
	}

}