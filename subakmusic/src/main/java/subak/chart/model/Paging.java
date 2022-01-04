package subak.chart.model;

public class Paging {
	/**
	 * @uml.property  name="w_size"
	 */
	private int w_size;// 페이지당 보여줄 글수
	/**
	 * @uml.property  name="p_size"
	 */
	private int p_size; // 페이지번호 표시수
	/**
	 * @uml.property  name="cur_Page"
	 */
	private int cur_Page; // 현재 페이지
	/**
	 * @uml.property  name="writing_Count"
	 */
	private int writing_Count;
	public Paging() {
		super();
	}

	/**
	 * Paging(한 화면에 보여질 글 수 , 페이지 분할 수 , 총 글의 갯수 , 현재 보고 있는 페이지 번호 );
	 */
	public void setPaging(int w_size, int p_size,int writing_Count, int cur_Page) {
		this.w_size = w_size;
		this.p_size = p_size;
		this.cur_Page = cur_Page;
		this.writing_Count =writing_Count;
	}

	//10,2,1
	/**
	 * 총 페이지 수를 리턴해주는 메소드 전체 글수를 페이지당 보여줄 글수로 나눈 값에 전체 글수를 페이지당 보여줄 글수로 나머지연산을
	 * 하여 구한 값이 0보다 크면 1을 더하고 아니면 0을 더함
	 * 
	 * @return 총페이지수
	 */
	public int getPage_Count() {
		return (writing_Count / w_size) + (writing_Count % w_size > 0 ? 1 : 0);
	}

	/**
	 * 페이지 시작 수를 리턴해주는 메소드
	 * 
	 * @return 페이지 시작수
	 */
	public int getPage_Start() {
		return ((cur_Page - 1) / p_size) * p_size + 1;
	}
	
	/**
	 * 페이지 마지막 수를 리턴해주는 메소드
	 * 
	 * @return 페이지 마지막 수
	 */
	public int getPage_End() {
		return Math.min(getPage_Start() + p_size - 1, getPage_Count());
	}

	//이부분은 11위에서 20위 부분이 되어야 한다.

	
	/**
	 * 글 범위 시작 번호
	 * 
	 * @return 글 범위 시작 번호
	 */
	public int getWriting_Start() {
		return getWriting_End() - w_size + 1;
	}

	/**
	 * 글 범위 끝 번호
	 * 
	 * @return 글 범위 끝 번호
	 */
	public int getWriting_End() {
		return cur_Page * w_size;
	}

	// getter, setter 추가

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