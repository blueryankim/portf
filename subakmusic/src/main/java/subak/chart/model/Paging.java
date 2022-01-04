package subak.chart.model;

public class Paging {
	/**
	 * @uml.property  name="w_size"
	 */
	private int w_size;// �������� ������ �ۼ�
	/**
	 * @uml.property  name="p_size"
	 */
	private int p_size; // ��������ȣ ǥ�ü�
	/**
	 * @uml.property  name="cur_Page"
	 */
	private int cur_Page; // ���� ������
	/**
	 * @uml.property  name="writing_Count"
	 */
	private int writing_Count;
	public Paging() {
		super();
	}

	/**
	 * Paging(�� ȭ�鿡 ������ �� �� , ������ ���� �� , �� ���� ���� , ���� ���� �ִ� ������ ��ȣ );
	 */
	public void setPaging(int w_size, int p_size,int writing_Count, int cur_Page) {
		this.w_size = w_size;
		this.p_size = p_size;
		this.cur_Page = cur_Page;
		this.writing_Count =writing_Count;
	}

	//10,2,1
	/**
	 * �� ������ ���� �������ִ� �޼ҵ� ��ü �ۼ��� �������� ������ �ۼ��� ���� ���� ��ü �ۼ��� �������� ������ �ۼ��� ������������
	 * �Ͽ� ���� ���� 0���� ũ�� 1�� ���ϰ� �ƴϸ� 0�� ����
	 * 
	 * @return ����������
	 */
	public int getPage_Count() {
		return (writing_Count / w_size) + (writing_Count % w_size > 0 ? 1 : 0);
	}

	/**
	 * ������ ���� ���� �������ִ� �޼ҵ�
	 * 
	 * @return ������ ���ۼ�
	 */
	public int getPage_Start() {
		return ((cur_Page - 1) / p_size) * p_size + 1;
	}
	
	/**
	 * ������ ������ ���� �������ִ� �޼ҵ�
	 * 
	 * @return ������ ������ ��
	 */
	public int getPage_End() {
		return Math.min(getPage_Start() + p_size - 1, getPage_Count());
	}

	//�̺κ��� 11������ 20�� �κ��� �Ǿ�� �Ѵ�.

	
	/**
	 * �� ���� ���� ��ȣ
	 * 
	 * @return �� ���� ���� ��ȣ
	 */
	public int getWriting_Start() {
		return getWriting_End() - w_size + 1;
	}

	/**
	 * �� ���� �� ��ȣ
	 * 
	 * @return �� ���� �� ��ȣ
	 */
	public int getWriting_End() {
		return cur_Page * w_size;
	}

	// getter, setter �߰�

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

	
	public Integer getCur_Page() {
		return cur_Page;
	}

	public void setCur_Page(Integer cur_Page) {
		this.cur_Page = cur_Page;
	}
}